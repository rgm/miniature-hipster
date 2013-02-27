//
//  main.m
//  pdftiler
//
//  Created by Ryan McCuaig on 2013/02/25.
//  Copyright (c) 2013 Ryan McCuaig. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Lagrangian/Lagrangian.h>
#include <getopt.h>

#import "RGMTileCutter.h"
#import "RGMImageTile.h"

@l3_suite("main");
@l3_test("dummy test should fail") {
  l3_assert(YES, l3_equals(NO));
}

int main(int argc, const char * argv[])
{
  long int rows = 1, cols = 1, dpi = 72;
  char *end, *filename = "";
  int c;
  while (1) {
    static struct option long_options[] = {
      {"rows", required_argument, 0, 'x'},
      {"cols", required_argument, 0, 'y'},
      {"dpi", required_argument, 0, 'd'},
      {0, 0, 0, 0}
    };
    int option_index = 0;
    c = getopt_long(argc, (char *const *)argv, "x:y:", long_options, &option_index);
    if (c == -1) { break; }

    switch (c) {

      case 'x':
        rows = strtol(optarg, &end, 10);
        break;

      case 'y':
        cols = strtol(optarg, &end, 10);
        break;

      case 'd':
        dpi = strtol(optarg, &end, 10);
        break;

      default:
        abort();
    }
  }
  if (optind < argc) {
    filename = (char *)argv[optind++];
  }
  
  @autoreleasepool {
    
    NSLog(@"dpi %ld rows %ld cols %ld filename %s", dpi, rows, cols, filename);
    NSURL *fileUrl = [NSURL URLWithString:[NSString stringWithCString:filename encoding:NSUTF8StringEncoding]];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:fileUrl];
    RGMTileCutter *cutter = [RGMTileCutter new];
    cutter.image = image;
    cutter.dpi = dpi;
    cutter.rows = rows;
    cutter.cols = cols;
    for (RGMImageTile *tile in [cutter tiles]) {
      [tile writeToDirectory:nil];
    }
  }
  return 0;
}


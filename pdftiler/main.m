//
//  main.m
//  pdftiler
//
//  Created by Ryan McCuaig on 2013/02/25.
//  Copyright (c) 2013 Ryan McCuaig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Lagrangian/Lagrangian.h>

@l3_suite("main");
@l3_test("dummy test should fail") {
  l3_assert(true, l3_equals(false));
}

int main(int argc, const char * argv[])
{

  @autoreleasepool {
      
      NSLog(@"Hello, World!");
      
  }
    return 0;
}


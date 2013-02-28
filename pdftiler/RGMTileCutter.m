//
//  RGMTileCutter.m
//  pdftiler
//
//  Created by Ryan McCuaig on 2013-02-27.
//  Copyright (c) 2013 Ryan McCuaig. All rights reserved.
//

#import "RGMTileCutter.h"
#import "RGMImageTile.h"

@interface RGMTileCutter () {
  CGPDFDocumentRef _pdf;
}

@property (readonly) CGPDFDocumentRef pdf;

@end

@implementation RGMTileCutter

- (void)dealloc
{
  if (_pdf) {
    CGPDFDocumentRelease(_pdf);
  }
}

- (CGPDFDocumentRef)pdf
{
  NSParameterAssert(_url);
  _pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef)(self.url));
  NSLog(@"number of pages %zu", CGPDFDocumentGetNumberOfPages(_pdf));
  CGPDFPageRef page = CGPDFDocumentGetPage(_pdf, 1);
  CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
  NSLog(@"%f %f %f %f", pageRect.origin.x, pageRect.origin.y, pageRect.size.width, pageRect.size.height);
  return _pdf;
}

- (NSArray *)tiles
{
  CGPDFDocumentRef x = [self pdf];
  NSLog(@"tiles");
  return @[[RGMImageTile new]];
}

@end

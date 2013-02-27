//
//  RGMTileCutter.h
//  pdftiler
//
//  Created by Ryan McCuaig on 2013-02-27.
//  Copyright (c) 2013 Ryan McCuaig. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RGMTileCutter : NSObject

@property CGFloat dpi;
@property int rows;
@property int cols;
@property NSImage *image;

- (NSArray *)tiles;

@end

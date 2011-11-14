//
//  ChannelInfo.h
//  RadioStreamer
//
//  Created by William Richardson on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelInfo : NSObject
{
    NSString *name;
    NSString *imagePath;
    UIImage *image;
    NSString *description;
    NSString *urlPath;
    NSURL *url;
    
}

- (id)initWithResource:(NSDictionary *)storage;

@property (nonatomic, readonly)NSString *name;
@property (nonatomic, readonly)UIImage *image;
@property (nonatomic, readonly)NSString *description;
@property (nonatomic, readonly)NSURL *url;

@end

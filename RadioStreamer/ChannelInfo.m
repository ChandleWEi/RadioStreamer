//
//  ChannelInfo.m
//  RadioStreamer
//
//  Created by William Richardson on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChannelInfo.h"

@implementation ChannelInfo

@synthesize name, image, description, url;

- (id)initWithResource:(NSDictionary *)storage
{
    // 
    [super init];
    
    if (self) {
        // Custom initialization
        static NSString *kNameLabel = @"name";
        static NSString *kImagePathLabel = @"imagePath";
        static NSString *kDescription = @"description";
        static NSString *kUrlPath = @"url";
        
        name = [storage objectForKey:kNameLabel];
        imagePath = [storage objectForKey:kImagePathLabel];
        description = [storage objectForKey:kDescription];
        urlPath = [storage objectForKey:kUrlPath];
    }
    
    NSLog(@"Channel Name: %@", name);
    NSLog(@"Image Path: %@", imagePath);
    NSLog(@"Channel Description: %@", description);
    NSLog(@"Channel URL: %@", urlPath);
    
    return self;
}

- (void)dealloc {
    // release owned objects here
    [super dealloc]; // pretty important.
}

- (UIImage *)image
{
    if (!image) {
        NSArray *imagePathParts = [imagePath componentsSeparatedByString:@"."];
        
        // path to the image file for the channel
        NSString *resourcePath = [[NSBundle mainBundle] 
                               pathForResource:[imagePathParts objectAtIndex:0] 
                                        ofType:[imagePathParts objectAtIndex:1]];
        
        image = [UIImage imageWithContentsOfFile:resourcePath];
    }
    
    return image;
}

- (NSURL *)url
{
    if (!url) {
        // create the Url
        
        url = [[NSURL alloc] initWithString:urlPath];
    }
    
    return url;
}

@end

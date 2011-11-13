//
//  ChannelInfo.m
//  RadioStreamer
//
//  Created by William Richardson on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChannelInfo.h"

@implementation ChannelInfo

@synthesize name, imagePath, image;

- (id)initWithResource:(NSDictionary *)storage
{
    // 
    [super init];
    
    if (self) {
        // Custom initialization
        static NSString *kNameLabel = @"name";
        static NSString *kImagePathLabel = @"imagePath";
        
        name = [storage objectForKey:kNameLabel];
        imagePath = [storage objectForKey:kImagePathLabel];
    }
    
    NSLog(@"Channel Name: %@", name);
    NSLog(@"Image Path: %@", imagePath);
    
    /*
    NSInteger pos = [indexPath row];
    NSLog(@"Pos: %d", pos);
    NSDictionary *cc = [self.channelInfo objectAtIndex:pos]; 
    NSString *cName = [cc objectForKey:@"name"];
	cell.textLabel.text = cName;
    */
    
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

@end

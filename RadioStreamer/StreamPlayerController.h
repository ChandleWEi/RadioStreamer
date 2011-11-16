//
//  PlayingStreamController.h
//  RadioStreamer
//
//  Created by William Richardson on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelInfo.h"

@class StreamPlayerController;

@protocol StreamPlayerControllerDelegate <NSObject>

@optional

- (void)StreamPlayerControllerWillDismiss:(StreamPlayerController *)vc;

@end

@interface StreamPlayerController : UIViewController
{
    IBOutlet UIImageView *songArt;
    IBOutlet UITextView *songInfo;
    IBOutlet UITableView *playedSongHistory;
}

@property (nonatomic, assign) id<StreamPlayerControllerDelegate> delegate;

- (id)initWithChannelInfo:(ChannelInfo *)channelInfo;

- (IBAction)back:(id)sender;

@end

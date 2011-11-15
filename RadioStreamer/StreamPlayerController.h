//
//  PlayingStreamController.h
//  RadioStreamer
//
//  Created by William Richardson on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelInfo.h"

@interface StreamPlayerController : UIViewController
{
    IBOutlet UIImageView *songArt;
    IBOutlet UITextView *songInfo;
    IBOutlet UITableView *playedSongHistory;
}

- (id)initWithChannelInfo:(ChannelInfo *)channelInfo;

- (IBAction)back:(id)sender;


@end

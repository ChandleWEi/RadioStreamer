//
//  ChannelSelectionController.h
//  RadioStreamer
//
//  Created by William Richardson on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelSelectionController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UILabel *streamInfoText;
    IBOutlet UITableView *channelList;
    IBOutlet UILabel *nowPlayingText;
    IBOutlet UITabBar *actionBar;
    
    NSArray *_channelInfos;
    
}

@property (nonatomic, retain) NSArray *channelInfos;

@end

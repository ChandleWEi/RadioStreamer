//
//  ChannelListingCell.h
//  RadioStreamer
//
//  Created by William Richardson on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelInfo.h"

@interface ChannelListingCell : UITableViewCell
{
    IBOutlet UIImageView *channelImage;
    IBOutlet UILabel *channelText;
}

- (void)applyChannelInfo:(ChannelInfo *)channelInfo;

@end

//
//  ChannelListingCell.m
//  RadioStreamer
//
//  Created by William Richardson on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChannelListingCell.h"

@implementation ChannelListingCell

@synthesize channelInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style 
                reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected 
              animated:animated];

    // Configure the view for the selected state
}

- (void)applyChannelInfo:(ChannelInfo *)cInfo
{
    UIColor *backgroundColor = [UIColor colorWithRed:BackgroundRed/255 
                                               green:BackgroundGreen/255 
                                                blue:BackgroundBlue/255 
                                               alpha:1.0];
    
    // store channelInfo for use by StreamPlayer later
    channelInfo = cInfo;
    
    self.backgroundColor = backgroundColor;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    // channel image
    self.imageView.image = channelInfo.image;
    
    // channel name
    self.textLabel.textColor = UIColor.lightGrayColor;
    self.textLabel.text = channelInfo.name;
    
    // channel description
    self.detailTextLabel.textColor = UIColor.lightGrayColor;
    self.detailTextLabel.text = channelInfo.description;
}

@end

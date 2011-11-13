//
//  ChannelSelectionController.m
//  RadioStreamer
//
//  Created by William Richardson on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ChannelSelectionController.h"
#import "ChannelListingCell.h"
#import "ChannelInfo.h"

@implementation ChannelSelectionController

@synthesize channelInfo = _channelInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil 
                           bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    [_channelInfo release];
    _channelInfo = nil;
}

- (void)dealloc
{
    // [_channelInfo release];
    // [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIColor *backgroundColor = [UIColor colorWithRed:BackgroundRed/255 
                                               green:BackgroundGreen/255 
                                                blue:BackgroundBlue/255 
                                               alpha:1.0];
    
    channelList.backgroundColor = backgroundColor;
    nowPlayingText.backgroundColor = backgroundColor;
    actionBar.backgroundColor = backgroundColor;
    
    // setup the channelList tableView
    channelList.dataSource = self;
    channelList.delegate = self;
    [channelList reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark View Rotate Settings

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Properties

- (NSArray *)channelInfo
{
    if (!_channelInfo) {
        // Path to the plist (in the application bundle)
        NSString *channelListPath = [[NSBundle mainBundle] pathForResource:@"ChannelList" 
                                                                    ofType:@"plist"];
        
        _channelInfo = [[NSArray alloc] initWithContentsOfFile:channelListPath];
    }
    
    return _channelInfo;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.channelInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"ChannelListCell";
    
    /*
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:kCellID] autorelease];
	}
     */
     
    ChannelListingCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[[ChannelListingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID] autorelease];
    }
    
    NSInteger pos = [indexPath row];
    NSDictionary *channelDict = [self.channelInfo objectAtIndex:pos];
    ChannelInfo *channelInfo = [[ChannelInfo alloc] initWithResource:channelDict];
    
    [cell applyChannelInfo:channelInfo];
    
	return cell;
}

#pragma mark -
#pragma mark rest of stuff


@end

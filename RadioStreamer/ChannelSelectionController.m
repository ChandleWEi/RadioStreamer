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
#import "StreamPlayerController.h"

@implementation ChannelSelectionController

@synthesize channelInfos = _channelInfos;

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
    [_channelInfos release];
    _channelInfos = nil;
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
    channelList.rowHeight = 75;     // set the height of UITableViewCell, for the larger image size
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
#pragma mark View Events

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    
    self.navigationController.navigationBarHidden = TRUE;
    self.navigationController.toolbarHidden = TRUE;
}

#pragma mark -
#pragma mark Properties

- (NSArray *)channelInfos
{
    if (!_channelInfos) {
        // Path to the plist (in the application bundle)
        NSString *channelListPath = [[NSBundle mainBundle] pathForResource:@"ChannelList" 
                                                                    ofType:@"plist"];
        
        _channelInfos = [[NSArray alloc] initWithContentsOfFile:channelListPath];
    }
    
    return _channelInfos;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.channelInfos count];
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
        cell = [[[ChannelListingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellID] autorelease];
    }
    
    NSInteger pos = [indexPath row];
    NSDictionary *channelDict = [self.channelInfos objectAtIndex:pos];
    ChannelInfo *channelInfo = [[ChannelInfo alloc] initWithResource:channelDict];
    
    [cell applyChannelInfo:channelInfo];
    
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*
	 To conform to the Human Interface Guidelines, selections should not be persistent --
	 deselect the row after it has been selected.
	 */
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // create the StreamPlayerController
    StreamPlayerController *streamPlayer = [[StreamPlayerController alloc] 
                                            initWithChannelInfo:[self.channelInfos objectAtIndex:[indexPath row]]];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:streamPlayer];
    
    streamPlayer.delegate = self;
    
    [streamPlayer release];
    
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    [navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    navController.navigationBar.barStyle = UIBarStyleBlack;
    
    // navController is retained by self when presented
    [self presentModalViewController:navController animated:YES];
    
    [navController release];

}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)StreamPlayerControllerWillDismiss:(StreamPlayerController *)vc
{
    NSLog(@"Recieved Dismiss Modal from StreamPlayer");
    
    // update the current stream playing status if needed
    
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark rest of stuff


@end

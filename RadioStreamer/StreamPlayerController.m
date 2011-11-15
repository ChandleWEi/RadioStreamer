//
//  PlayingStreamController.m
//  RadioStreamer
//
//  Created by William Richardson on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StreamPlayerController.h"
#import "ChannelInfo.h"

@implementation StreamPlayerController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithChannelInfo:(ChannelInfo *)cInfo
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        
        /*
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                                            target:self 
                                                            action:@selector(cancel:)];
        
        [[self navigationItem] setLeftBarButtonItem:cancelItem];
        [cancelItem release];
        */
        
        // UINavigationItem *channelListNav = [[UINavigationItem alloc] initWithTitle:@"Channel List"];
        // UINavigationItem *streamPlayerNav = [[UINavigationItem alloc] initWithTitle:@"Now Playing"];
        
        // navBar.items = [[NSArray alloc] initWithObjects:channelListNav, streamPlayerNav, nil];
        
        self.navigationController.navigationBar.backItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Channel List" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - interface operations

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)back:(id)sender
{
    NSLog(@"Called back on NavBar");
}

@end

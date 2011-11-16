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

@synthesize delegate;

- (id)initWithChannelInfo:(ChannelInfo *)cInfo
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        // Custom initialization
        UIBarButtonItem *back2ChannelList = [[UIBarButtonItem alloc] initWithTitle:@"ChannelList" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
        
        [[self navigationItem] setLeftBarButtonItem:back2ChannelList];
        
        [back2ChannelList release];
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
    
    if([delegate respondsToSelector:@selector(StreamPlayerControllerWillDismiss:)]) {
        [delegate StreamPlayerControllerWillDismiss:self];
    }
}

@end

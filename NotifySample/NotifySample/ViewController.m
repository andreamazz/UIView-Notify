//
//  ViewController.m
//  NotifySample
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Notify.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonNotify:(id)sender
{
	[self.view notify:@"Sample Notification"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

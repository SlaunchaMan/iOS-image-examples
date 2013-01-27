//
//  JKPatternImageViewController.m
//  ImageExamples
//
//  Created by Jeffrey Kelley on 7/11/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "JKPatternImageViewController.h"

@interface JKPatternImageViewController ()

@end

@implementation JKPatternImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	UIImage *image = [UIImage imageNamed:@"plaid"];
	[[self view] setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

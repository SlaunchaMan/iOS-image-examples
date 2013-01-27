//
//  JKAnimatedImageViewController.m
//  ImageExamples
//
//  Created by Jeffrey Kelley on 7/10/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "JKAnimatedImageViewController.h"

@interface JKAnimatedImageViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation JKAnimatedImageViewController
@synthesize imageView;

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
	
	UIImage *image = [UIImage animatedImageNamed:@"png" duration:1.0];
	[[self imageView] setImage:image];
}

- (void)viewDidUnload
{
	[self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

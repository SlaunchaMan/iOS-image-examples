//
//  JKImageViewInterpolationViewController.m
//  ImageExamples
//
//  Created by Jeffrey Kelley on 7/9/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "JKImageViewInterpolationViewController.h"

@interface JKImageViewInterpolationViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISlider *slider;

- (IBAction)sliderValueChanged:(UISlider *)sender;

@end

@implementation JKImageViewInterpolationViewController
@synthesize imageView;
@synthesize slider;

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
}

- (void)viewDidUnload
{
	[self setImageView:nil];
	[self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sliderValueChanged:(UISlider *)sender
{
	CGRect imageViewFrame = [[self imageView] frame];
	
	imageViewFrame.size.width = floorf([sender value]);
	imageViewFrame.size.height = floorf([sender value]);
	
	if (CGRectEqualToRect([[self imageView] frame], imageViewFrame) == NO) {
		[[self imageView] setFrame:imageViewFrame];
	}
}

@end

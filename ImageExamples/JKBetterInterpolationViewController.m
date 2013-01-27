//
//  JKBetterInterpolationViewController.m
//  ImageExamples
//
//  Created by Jeffrey Kelley on 7/11/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "JKBetterInterpolationViewController.h"

#import "UIImage+Resize.h"

@interface JKBetterInterpolationViewController () {
	UIImageView	*_interpolatedImageView;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)sliderEditingBegan:(UISlider *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)sliderEditingDidEnd:(UISlider *)sender;

@end

@implementation JKBetterInterpolationViewController

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

- (IBAction)sliderEditingBegan:(UISlider *)sender
{
	[_interpolatedImageView removeFromSuperview];
	_interpolatedImageView = nil;
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

- (IBAction)sliderEditingDidEnd:(id)sender
{
	CGSize size = [[self imageView] frame].size;
    
	UIImage *interpolatedImage =
    [[[self imageView] image] resizedImageWithContentMode:UIViewContentModeScaleAspectFill
                                                   bounds:size
                                     interpolationQuality:kCGInterpolationHigh];
	
	_interpolatedImageView = [[UIImageView alloc] initWithImage:interpolatedImage];
	[_interpolatedImageView setFrame:[[self imageView] frame]];
	[_interpolatedImageView setClipsToBounds:YES];
	[_interpolatedImageView setContentMode:UIViewContentModeScaleAspectFill];
	
	[[self view] addSubview:_interpolatedImageView];
}

@end

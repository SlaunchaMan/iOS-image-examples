//
//  JKResizableImageViewController.m
//  ImageExamples
//
//  Created by Jeffrey Kelley on 7/9/12.
//  Copyright (c) 2012 Detroit Labs. All rights reserved.
//

#import "JKResizableImageViewController.h"

@interface JKResizableImageViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISlider *slider;

- (IBAction)sliderValueChanged:(UISlider *)sender;

@end

@implementation JKResizableImageViewController
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
	
	UIImage *image = [[UIImage imageNamed:@"orangedot"] resizableImageWithCapInsets:UIEdgeInsetsMake(20.0f, 20.0f, 20.0f, 20.0f)];
	
	[[self imageView] setImage:image];
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

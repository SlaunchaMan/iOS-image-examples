//
//  JKCustomImageRenderingViewController.m
//  ImageExamples
//
//  Created by Jeff Kelley on 1/9/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//


#import "JKCustomImageRenderingViewController.h"


@interface JKCustomImageRenderingViewController()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (void)renderNoiseImage;

@end


@implementation JKCustomImageRenderingViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date]
                                              interval:1.0 / 60.0
                                                target:self
                                              selector:@selector(renderNoiseImage)
                                              userInfo:nil
                                               repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    
    [super viewDidUnload];
}

- (void)renderNoiseImage
{
    size_t width = (size_t)(CGRectGetWidth([self imageView].bounds) * [[UIScreen mainScreen] scale]);
    size_t height = (size_t)(CGRectGetHeight([self imageView].bounds) * [[UIScreen mainScreen] scale]);
    
    size_t bitsPerComponent = 8;
    size_t componentsPerPixel = 4;
    size_t bytesPerPixel = (bitsPerComponent / 8) * componentsPerPixel;
    size_t bytesPerRow = bytesPerPixel * width;
    
    uint8_t *buffer = calloc(sizeof(uint8_t), componentsPerPixel * width * height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(buffer,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast);
    
    for (size_t y = 0; y < height; y++) {
        for (size_t x = 0; x < width; x++) {
            size_t offset = (bytesPerRow * y) + (bytesPerPixel * x);
            
            // Set R, G, and B to random values, alpha to the largest (since it's premultiplied)
            uint8_t red   = arc4random_uniform(UINT8_MAX);
            uint8_t green = arc4random_uniform(UINT8_MAX);
            uint8_t blue  = arc4random_uniform(UINT8_MAX);
            
            buffer[offset]     = red;
            buffer[offset + 1] = green;
            buffer[offset + 2] = blue;
            buffer[offset + 3] = MAX(MAX(red, green), blue);
        }
    }
    
    CGImageRef noiseImageRef = CGBitmapContextCreateImage(context);
    
    UIImage *noiseImage = [[UIImage alloc] initWithCGImage:noiseImageRef
                                                     scale:[[UIScreen mainScreen] scale]
                                               orientation:UIImageOrientationUp];
    
    [[self imageView] setImage:noiseImage];
    
    CGImageRelease(noiseImageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(buffer);
}

@end

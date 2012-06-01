//
//  HappinesViewController.m
//  Happines
//
//  Created by Антон Помозов on 01.06.12.
//  Copyright (c) 2012 Штрих-М. All rights reserved.
//

#import "HappinesViewController.h"
#import "FaceView.h"

@interface HappinesViewController() <FaceViewDataSource>

@property (nonatomic, weak) IBOutlet FaceView *faceView;

@end

@implementation HappinesViewController

@synthesize happines = _happines;
@synthesize faceView = _faceView;

- (void)setHappines:(int)happines
{
    _happines = happines;
    [self.faceView setNeedsDisplay];
}

- (void)setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)];
    [self.faceView addGestureRecognizer:pinchRecognizer];

    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinesGesture:)];
    [self.faceView addGestureRecognizer:panRecognizer];
    
    self.faceView.dataSource = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Website"]) {
        CGRect frame = [segue.destinationViewController view].bounds;
        UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
        webView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleRightMargin |
                                   UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleWidth |
                                   UIViewAutoresizingFlexibleHeight;
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
        
        [[segue.destinationViewController view] addSubview:webView];
    }
}


- (void)handleHappinesGesture:(UIPanGestureRecognizer *)recognizer
{
    if ( (recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded) )
    {
        CGPoint translation = [recognizer translationInView:self.faceView];
        self.happines -= translation.y / 2;
        [recognizer setTranslation:CGPointZero inView:self.faceView];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (float)smileForFaceView:(FaceView *)sender
{
    return (self.happines - 50) / 50.0;
}

@end

//
//  DrPillWebsiteViewController.m
//  Psychologist
//
//  Created by Антон Помозов on 05.06.12.
//  Copyright (c) 2012 Штрих-М. All rights reserved.
//

#import "DrPillWebsiteViewController.h"

@interface DrPillWebsiteViewController ()

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end

@implementation DrPillWebsiteViewController

@synthesize webView = _webView;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

@end

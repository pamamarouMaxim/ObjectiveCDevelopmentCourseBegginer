//
//  CBWebViewController.m
//  CBWebViewHVLesson39
//
//  Created by Alina on 07.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import "CBWebViewController.h"

@interface CBWebViewController ()

@end

@implementation CBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.frame = self.view.bounds;
    
    NSString* urlString = self.adressToMove;
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.indicatorLoading startAnimating];

    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.indicatorLoading stopAnimating];
    self.buttonBack.enabled = [self.webView canGoBack];
    self.buttonForward.enabled = [self.webView canGoForward];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.indicatorLoading stopAnimating];
    self.buttonBack.enabled = [self.webView canGoBack];
    self.buttonForward.enabled = [self.webView canGoForward];
    
}

#pragma mark Action

- (IBAction)actionBack:(UIBarButtonItem *)sender {
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
    
}

- (IBAction)actionForward:(UIBarButtonItem *)sender {
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
    
}

- (IBAction)actionrefresh:(UIBarButtonItem *)sender {
    [self.webView stopLoading];
    [self.webView reload];
    
}
@end

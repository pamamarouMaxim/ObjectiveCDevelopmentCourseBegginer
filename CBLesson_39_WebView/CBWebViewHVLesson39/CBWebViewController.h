//
//  CBWebViewController.h
//  CBWebViewHVLesson39
//
//  Created by Alina on 07.01.18.
//  Copyright © 2018 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBWebViewController : UIViewController <UIWebViewDelegate>


@property (strong,nonatomic) NSString* adressToMove;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonForward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonRefresh;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorLoading;

- (IBAction)actionBack:(UIBarButtonItem *)sender;
- (IBAction)actionForward:(UIBarButtonItem *)sender;
- (IBAction)actionrefresh:(UIBarButtonItem *)sender;


@end

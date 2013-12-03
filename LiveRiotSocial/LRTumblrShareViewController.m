//
//  LRTumblrShareViewController.m
//  LiveRiotSocial
//
//  Created by Gabriel Yeah on 13-10-30.
//  Copyright (c) 2013年 LiveRiot. All rights reserved.
//

#import "LRTumblrShareViewController.h"
#import "CRNavigationController.h"
#import "TMAPIClient.h"
#import "NSUserDefaults+SocialNetwork.h"

@interface LRTumblrShareViewController ()

@end

@implementation LRTumblrShareViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.textView setText:[NSString stringWithFormat:@"#LiveRiotMusic %@", self.shareLink]];
}

- (void)configureNavigationBar {
    [super configureNavigationBar];
    self.navigationItem.title = @"Share to Tumblr";
}

#pragma mark - Actions

- (void)didClickPostButton:(UIButton *)sender {
  NSString *content = self.textView.text;
  if (!content || [content isEqualToString:@""]) {
    content = @"Check it out!";
  }
  [[TMAPIClient sharedInstance] link:[NSUserDefaults getTumblrUserLink]
                          parameters:@{@"url": self.shareLink,
                                       @"title" : @"Video from LiveRiot",
                                       @"description" : content}
                            callback:^(id a, NSError *error) {
                              [self dismiss:error];
                            }];
}

- (void)dismiss:(NSError *)error
{
  if (!error) {
    NSLog(@"Succeed");
    
    [self dismissViewControllerAnimated:YES completion:^{
      [[[UIAlertView alloc] initWithTitle:@"Success"
                                  message:[NSString stringWithFormat:@"Post succeeded :)"]
                                 delegate:nil
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil]
       show];
    }];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Failed"
                                message:[NSString stringWithFormat:@"Post failed :("]
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
  }
}

@end

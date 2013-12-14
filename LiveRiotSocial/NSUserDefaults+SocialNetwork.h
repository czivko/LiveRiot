//
//  NSUserDefaults+SocialNetwork.h
//  LiveRiotSocial
//
//  Created by Gabriel Yeah on 13-11-19.
//  Copyright (c) 2013年 LiveRiot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SocialNetwork)

+ (NSString *)getFacebookUserName;
+ (void)setFacebookUserName:(NSString *)userName;

+ (NSString *)getTumblrTokenKey;
+ (NSString *)getTumblrTokenSecret;
+ (void)setTumblrTokenKey:(NSString *)key;
+ (void)setTumblrTokenSecret:(NSString *)secret;
+ (NSString *)getTumblrUserName;
+ (NSString *)getTumblrUserLink;
+ (void)setTumblrUserName:(NSString *)userName;

+ (NSString *)getTwitterUserName;
+ (void)setTwitterUserName:(NSString *)userName;
+ (NSString *)getTwitterSelectedAccount;
+ (void)setTwitterSelectedAccount:(NSString *)accountUserName;
+ (NSString *)getTwitterTokenKey;
+ (NSString *)getTwitterTokenSecret;
+ (void)setTwitterTokenKey:(NSString *)key;
+ (void)setTwitterTokenSecret:(NSString *)secret;

@end

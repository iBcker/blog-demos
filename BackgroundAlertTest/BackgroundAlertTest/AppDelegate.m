//
//  AppDelegate.m
//  BackgroundAlertTest
//
//  Created by iBcker on 15/8/30.
//  Copyright © 2015年 ibcker. All rights reserved.
//

#import "AppDelegate.h"
#import "CFUserNotification.h"


CFUserNotificationRef _userNotification;
CFRunLoopSourceRef _runLoopSource;

static void callback(CFUserNotificationRef alert, CFOptionFlags responseFlags)

{
    CFDictionaryRef response = CFUserNotificationGetResponseDictionary(_userNotification);
    NSLog(@"%@",(__bridge NSDictionary *)response);
    CFRunLoopRemoveSource(CFRunLoopGetMain(), _runLoopSource, kCFRunLoopCommonModes);
    CFRelease(_runLoopSource);
    CFRelease(_userNotification);
}

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    
    CFOptionFlags flags = CFUserNotificationSecureTextField(0);

    CFStringRef keys[] = {
        kCFUserNotificationAlertTopMostKey,
        kCFUserNotificationAlertHeaderKey,
        kCFUserNotificationAlertMessageKey,
        kCFUserNotificationAlternateButtonTitleKey,
        kCFUserNotificationDefaultButtonTitleKey,
        kCFUserNotificationTextFieldTitlesKey
    };
    
    CFStringRef values[] = {
        kCFBooleanTrue,
        CFSTR("alert"),
        CFSTR("应用外弹窗"),
        CFSTR("Cancel"),
        CFSTR("Ok"),
        CFSTR("password")
    };
    CFDictionaryRef dict = CFDictionaryCreate(NULL,
                                              (const void **)keys,
                                              (const void **)values,
                                              sizeof(keys)/sizeof(*keys),
                                              &kCFTypeDictionaryKeyCallBacks,
                                              &kCFTypeDictionaryValueCallBacks);
    
    _userNotification = CFUserNotificationCreate(NULL, 0.0, flags, NULL, dict);
    _runLoopSource = CFUserNotificationCreateRunLoopSource(NULL, _userNotification, callback, 0);
    CFRunLoopAddSource(CFRunLoopGetMain(), _runLoopSource, kCFRunLoopCommonModes);

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

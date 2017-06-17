//
//  InterfaceController.m
//  WatchApp WatchKit Extension
//
//  Created by Eirik Halvorsen on 12/05/2017.
//  Copyright © 2017 Eirik Halvorsen. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface InterfaceController ()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)sendLockRequest {
    NSDictionary *request = [[NSDictionary alloc] initWithObjectsAndKeys:@"LockMyPhone", @"YES", nil];
    
    if([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
        //[session transferUserInfo:request];
        [session sendMessage:request replyHandler:nil errorHandler:nil];
        
        NSLog(@"Sent message");
    }
    
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.akaslow.LockMyPhone-SB"), (__bridge const void *)(self), nil, TRUE);
}

- (IBAction)lockPhoneAction {
    [self sendLockRequest];
}

@end




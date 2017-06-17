//
//  ViewController.m
//  WatchApp
//
//  Created by Eirik Halvorsen on 12/05/2017.
//  Copyright © 2017 Eirik Halvorsen. All rights reserved.
//

#import "ViewController.h"
#import <WatchKit/WatchKit.h>
#import <CoreFoundation/CoreFoundation.h>

#import <NotificationCenter/NotificationCenter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Check and activate our session
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        [session setDelegate:self];
        [session activateSession];
        
        [_statusLabel setText:@"Status: Connected"];
    }
    else {
        [_statusLabel setText:@"Error: Device not supported for WatchConnectivity!"];
    }
    
    NSLog(@"--< Startup complete >--");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//We want to hook into this and lock our phone instead
-(void)handleLockRequest {
    NSLog(@"WATCH_APP: Received message");
}


//DELEGATES

-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message {
    [self handleLockRequest];
}

-(void)sessionDidDeactivate:(WCSession *)session {
    return;
}

-(void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error {
    return;
}

-(void)sessionDidBecomeInactive:(WCSession *)session {
    [_statusLabel setText:@"Status: Disconnected"];
}

@end

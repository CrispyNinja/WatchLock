//
//  InterfaceController.h
//  WatchApp WatchKit Extension
//
//  Created by Eirik Halvorsen on 12/05/2017.
//  Copyright © 2017 Eirik Halvorsen. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController : WKInterfaceController<WCSessionDelegate>

-(void)sendLockRequest;
- (IBAction)lockPhoneAction;



@end

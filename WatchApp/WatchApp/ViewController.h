//
//  ViewController.h
//  WatchApp
//
//  Created by Eirik Halvorsen on 12/05/2017.
//  Copyright © 2017 Eirik Halvorsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController : UIViewController<WCSessionDelegate>

-(void)handleLockRequest;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;



@end


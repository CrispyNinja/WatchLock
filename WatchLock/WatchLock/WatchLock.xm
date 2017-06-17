
#define HBLogError NSLog

#import <substrate.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

#import <NotificationCenter/NotificationCenter.h>

@interface SpringBoard : NSObject
- (void)_simulateLockButtonPress;
@end

@implementation CPDistributedMessagingCenter
@end

void receiveDarwin(CFNotificationCenterRef center,
                   void *observer,
                   CFStringRef name,
                   const void *object,
                   CFDictionaryRef userInfo)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.akaslow.LockMyPhone-SB-Watch" object:nil];
}

%hook SpringBoard

%new
- (void)didReceivedNSNotification
{
    [((SpringBoard *)[%c(SpringBoard) sharedApplication]) _simulateLockButtonPress];
}

- (void)applicationDidFinishLaunching:(id)application {
    %orig;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNSNotification) name:@"com.akaslow.LockMyPhone-SB-Watch" object:nil];
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), (__bridge const void *)(self), receiveDarwin, CFSTR("com.akaslow.LockMyPhone-SB"), NULL, CFNotificationSuspensionBehaviorDrop);
}

%end


%hook ViewController

-(void)handleLockRequest {
    //%orig();
    
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.akaslow.LockMyPhone-SB"), (__bridge const void *)(self), nil, TRUE);
}

%end





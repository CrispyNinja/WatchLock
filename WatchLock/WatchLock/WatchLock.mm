#line 1 "/Users/eirikhalvorsen/Desktop/Xcode/WatchLock/WatchLock/WatchLock.xm"

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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SpringBoard; @class ViewController; 
static void _logos_method$_ungrouped$SpringBoard$didReceivedNSNotification(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$ViewController$handleLockRequest)(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$ViewController$handleLockRequest(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SpringBoard(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SpringBoard"); } return _klass; }
#line 17 "/Users/eirikhalvorsen/Desktop/Xcode/WatchLock/WatchLock/WatchLock.xm"
static void lockDevice() {
    [((SpringBoard *)[_logos_static_class_lookup$SpringBoard() sharedApplication]) _simulateLockButtonPress];
}

void receiveDarwin(CFNotificationCenterRef center,
                   void *observer,
                   CFStringRef name,
                   const void *object,
                   CFDictionaryRef userInfo)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.akaslow.LockMyPhone-SB-Watch" object:nil];
}





static void _logos_method$_ungrouped$SpringBoard$didReceivedNSNotification(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [((SpringBoard *)[_logos_static_class_lookup$SpringBoard() sharedApplication]) _simulateLockButtonPress];
}

static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNSNotification) name:@"com.akaslow.LockMyPhone-SB-Watch" object:nil];
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), (__bridge const void *)(self), receiveDarwin, CFSTR("com.akaslow.LockMyPhone-SB"), NULL, CFNotificationSuspensionBehaviorDrop);
}






static void _logos_method$_ungrouped$ViewController$handleLockRequest(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$ViewController$handleLockRequest(self, _cmd);
    
    NSLog(@"APP_WATCH: Sending lock...");
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
    });
    
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.akaslow.LockMyPhone-SB"), (__bridge const void *)(self), nil, TRUE);
    
    NSLog(@"APP_WATCH: Sent!");
}






static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(didReceivedNSNotification), (IMP)&_logos_method$_ungrouped$SpringBoard$didReceivedNSNotification, _typeEncoding); }if (_logos_class$_ungrouped$SpringBoard) {MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);} else {HBLogError(@"logos: nil class %s", "SpringBoard");}Class _logos_class$_ungrouped$ViewController = objc_getClass("ViewController"); if (_logos_class$_ungrouped$ViewController) {MSHookMessageEx(_logos_class$_ungrouped$ViewController, @selector(handleLockRequest), (IMP)&_logos_method$_ungrouped$ViewController$handleLockRequest, (IMP*)&_logos_orig$_ungrouped$ViewController$handleLockRequest);} else {HBLogError(@"logos: nil class %s", "ViewController");}} }
#line 69 "/Users/eirikhalvorsen/Desktop/Xcode/WatchLock/WatchLock/WatchLock.xm"

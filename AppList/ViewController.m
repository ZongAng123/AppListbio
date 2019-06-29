//
//  ViewController.m
//  AppList
//
//  Created by 纵昂 on 2019/6/29.
//  Copyright © 2019 纵昂 https://github.com/ZongAng123. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getAppPlist];
}

-(void)getAppPlist{
    
//    Class LSApplicationWorkspace_Class = NSClassFromString(@"LSApplicationWorkspace");
//    NSObject *workspace = [LSApplicationWorkspace_Class performSelector:NSSelectorFromString(@"defaultWorkspace")];
//    NSArray *appList = [workspace performSelector:NSSelectorFromString(@"allApplications")];
//    for (id app in appList) {
//        NSLog(@"-----App列表----%@", [app performSelector:NSSelectorFromString(@"applicationIdentifier")]);
//    }
    
    id space = [NSClassFromString(@"LSApplicationWorkspace") performSelector:@selector(defaultWorkspace)];
    NSArray *plugins = [space performSelector:@selector(installedPlugins)];
    NSMutableSet *list = [[NSMutableSet alloc] init];
    for (id plugin in plugins) {
        id bundle = [plugin performSelector:@selector(containingBundle)];
        if (bundle)
            [list addObject:bundle];
    }
    int a = 1;
    for (id plugin in list) {
        NSLog(@"🐒 %d--",a);
        a++;
        NSLog(@"bundleIdentifier =%@", [plugin performSelector:@selector(bundleIdentifier)]);//bundleID
        
        NSLog(@"applicationDSID =%@", [plugin performSelector:@selector(applicationDSID)]);
        NSLog(@"applicationIdentifier =%@", [plugin performSelector:@selector(applicationIdentifier)]);
        NSLog(@"applicationType =%@", [plugin performSelector:@selector(applicationType)]);
        NSLog(@"dynamicDiskUsage =%@", [plugin performSelector:@selector(dynamicDiskUsage)]);
        
        NSLog(@"itemID =%@", [plugin performSelector:@selector(itemID)]);
        NSLog(@"itemName =%@", [plugin performSelector:@selector(itemName)]);
        NSLog(@"minimumSystemVersion =%@", [plugin performSelector:@selector(minimumSystemVersion)]);
        
        NSLog(@"requiredDeviceCapabilities =%@", [plugin performSelector:@selector(requiredDeviceCapabilities)]);
        NSLog(@"sdkVersion =%@", [plugin performSelector:@selector(sdkVersion)]);
        NSLog(@"shortVersionString =%@", [plugin performSelector:@selector(shortVersionString)]);
        
        NSLog(@"sourceAppIdentifier =%@", [plugin performSelector:@selector(sourceAppIdentifier)]);
        NSLog(@"staticDiskUsage =%@", [plugin performSelector:@selector(staticDiskUsage)]);
        NSLog(@"teamID =%@", [plugin performSelector:@selector(teamID)]);
        NSLog(@"vendorName =%@", [plugin performSelector:@selector(vendorName)]);
    }
    return;
    
    
}
@end

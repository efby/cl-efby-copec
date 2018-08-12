#import "EfbyPlugin.h"

#import <Cordova/CDVAvailability.h>

@implementation EfbyPlugin

- (void)pluginInitialize {
}

- (void)getAppName : (CDVInvokedUrlCommand *)command
{
    NSString * callbackId = command.callbackId;
    NSString * version =[[[NSBundle mainBundle]infoDictionary]objectForKey :@"CFBundleDisplayName"];
    CDVPluginResult * pluginResult =[CDVPluginResult resultWithStatus : CDVCommandStatus_OK messageAsString : version];
    [self.commandDelegate sendPluginResult : pluginResult callbackId : callbackId];
}

- (void)getInfoApp:(CDVInvokedUrlCommand*)command
{
   
    NSString * callbackId = command.callbackId;
    NSString * CFBundleDisplayName =[[[NSBundle mainBundle]infoDictionary]objectForKey :@"CFBundleDisplayName"];
    NSString * CFBundleShortVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    if (CFBundleShortVersionString == nil) {
      NSLog(@"CFBundleShortVersionString was nil, attempting CFBundleVersion");
      CFBundleShortVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
      if (CFBundleShortVersionString == nil) {
        NSLog(@"CFBundleVersion was also nil, giving up");
        // not calling error callback here to maintain backward compatibility
      }
    }
     NSString* CFBundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

     NSDictionary *payload = [NSDictionary dictionaryWithObjectsAndKeys:
            CFBundleVersion, @"VersionCode", 
            CFBundleDisplayName, @"AppName", 
            CFBundleShortVersionString, @"VersionNumber", 
            nil];


    CDVPluginResult * pluginResult =[CDVPluginResult resultWithStatus : CDVCommandStatus_OK messageAsDictionary : payload];


    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)getVersionNumber:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = command.callbackId;
    NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    if (version == nil) {
      NSLog(@"CFBundleShortVersionString was nil, attempting CFBundleVersion");
      version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
      if (version == nil) {
        NSLog(@"CFBundleVersion was also nil, giving up");
        // not calling error callback here to maintain backward compatibility
      }
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:version];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)getVersionCode:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = command.callbackId;
    NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:version];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end

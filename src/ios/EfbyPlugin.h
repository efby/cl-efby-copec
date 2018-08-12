#import <Cordova/CDVPlugin.h>

@interface EfbyPlugin : CDVPlugin {
}

// Encabezados de las funciones del plugin
- (void)getAppName:(CDVInvokedUrlCommand*)command;

- (void)getInfoApp:(CDVInvokedUrlCommand*)command;

- (void)getVersionNumber:(CDVInvokedUrlCommand*)command;

- (void)getVersionCode:(CDVInvokedUrlCommand*)command;

@end

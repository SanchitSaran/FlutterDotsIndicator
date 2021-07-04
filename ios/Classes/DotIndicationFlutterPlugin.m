#import "DotIndicationFlutterPlugin.h"
#if __has_include(<dot_indication_flutter/dot_indication_flutter-Swift.h>)
#import <dot_indication_flutter/dot_indication_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dot_indication_flutter-Swift.h"
#endif

@implementation DotIndicationFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDotIndicationFlutterPlugin registerWithRegistrar:registrar];
}
@end

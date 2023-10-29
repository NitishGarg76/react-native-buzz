#import <React/RCTBridgeModule.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h> // Import UIKit for UIAlertController

@interface RCT_EXTERN_MODULE(Buzz, NSObject)

RCT_EXTERN_METHOD(vibrate) // Expose the vibrate method
RCT_EXTERN_METHOD(vibrateLowIntensity: (float)intensity)

@end

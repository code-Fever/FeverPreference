#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FeverProperties.h"
#import "FeverRuntimeExtensions.h"
#import "MFFPreference.h"

FOUNDATION_EXPORT double FeverPreferenceVersionNumber;
FOUNDATION_EXPORT const unsigned char FeverPreferenceVersionString[];


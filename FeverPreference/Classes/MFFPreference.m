//
//  MFFPreference.m
//  fresh
//
//  Created by Mac_Dan on 2019/9/2.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "MFFPreference.h"
#import <objc/runtime.h>
#import "DDGProperties.h"
#import "EXTRuntimeExtensions.h"


@implementation MFFPreference


#pragma mark - Property Reading/Writing Methods

- (instancetype) init {
    self = [super init];
    if (self) {
        [self readAndObserveProperties];
    }
    return self;
}

- (void) dealloc {
    [self removeSelfObserver];
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - Property Reading/Writing Methods
static void *ddgPreferencesContext = &ddgPreferencesContext;
//读取并KVO
- (void) readAndObserveProperties {
    unsigned int     propertyCount = 0;
    objc_property_t *propertyList  = class_copyPropertyList(self.class, &propertyCount);
    const char      *className     = class_getName(self.class);
//    MMKV *mmky = [MMKV defaultMMKV];;
    for (unsigned int i = 0; i < propertyCount; i++) {
        
        const char *propName = property_getName(propertyList[i]);
        objc_property_t property = propertyList[i];
        mtl_propertyAttributes *attributes = mtl_copyPropertyAttributes(property);
        Class propertyClass = attributes->objectClass;

        if (supportedPropName(propName)) {
            NSString   *prefKey  = [NSString.alloc initWithFormat: @"%s_%s", className, propName];
            
            id pref;
            if (*(attributes->type) == *(@encode(id))) {
//                pref  = [mmky getObjectOfClass:propertyClass forKey:prefKey];
            } else  {
                pref = [[NSUserDefaults standardUserDefaults] objectForKey:prefKey];
            }
            NSString   *key = [NSString.alloc initWithBytesNoCopy: (void *)propName
                                                           length: strlen( propName)
                                                         encoding: NSUTF8StringEncoding
                                                     freeWhenDone: NO];
            id value = [self valueForKey:key];
            if (pref && ![value isEqual:pref]) {
                [self setValue: pref forKey: key];
            }
            
            NSString *name = [NSString.alloc initWithBytesNoCopy: (void *)propName
                                                          length: strlen(propName)
                                                        encoding: NSUTF8StringEncoding
                                                    freeWhenDone: NO];
            [self addObserver: self
                   forKeyPath: name
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context: ddgPreferencesContext];
        }
        free(attributes);
    }
    
    (void)(free(propertyList)), propertyList = NULL;
}

//写入
- (void) observeValueForKeyPath: (NSString *) keyPath
                       ofObject: (id) object
                         change: (NSDictionary *) change
                        context: (void *) context {
    if (context == ddgPreferencesContext) {
        id<NSObject> newValue = [change valueForKey: NSKeyValueChangeNewKey];
        id<NSObject> oldValue = [change valueForKey: NSKeyValueChangeOldKey];
        const char      *className     = class_getName(self.class);
        NSString   *prefKey  = [NSString.alloc initWithFormat: @"%s_%@", className, keyPath];
        
        if (newValue && ![newValue isEqual: oldValue]) {
            objc_property_t property = class_getProperty([self class], (char *)[keyPath UTF8String]);
            mtl_propertyAttributes *attributes = mtl_copyPropertyAttributes(property);
            if (*(attributes->type) == *(@encode(id))) {
//                MMKV *mmky = [MMKV defaultMMKV];
//                [mmky setObject:newValue forKey:prefKey];
            } else {
                [[NSUserDefaults standardUserDefaults] setObject:newValue forKey:prefKey];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
           
        }
    }
}

- (void) removeSelfObserver {
    unsigned int     propertyCount = 0;
    objc_property_t *propertyList  = class_copyPropertyList([self class], &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++) {
        const char *propName = property_getName(propertyList[i]);
        if (supportedPropName(propName)) {
            NSString *name = [NSString.alloc initWithBytesNoCopy: (void *)propName
                                                          length: strlen(propName)
                                                        encoding: NSUTF8StringEncoding
                                                    freeWhenDone: NO];
            [self removeObserver: self forKeyPath: name context: ddgPreferencesContext];
        }
    }
    (void)(free(propertyList)), propertyList = NULL;
}

@end

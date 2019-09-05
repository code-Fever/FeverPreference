//
//  FeverProperties.c
//  FeverPreference
//
//  Created by Mac_Dan on 2019/9/5.
//

#include "FeverProperties.h"
#include <string.h>

inline bool supportedPropName(const char *propName) {
    return (strcmp(propName, "hash") != 0 &&
            strcmp(propName, "superclass") != 0 &&
            strcmp(propName, "description") != 0 &&
            strcmp(propName, "debugDescription") != 0);
}

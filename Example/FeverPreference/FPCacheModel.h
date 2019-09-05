//
//  FPCacheModel.h
//  FeverPreference_Example
//
//  Created by Mac_Dan on 2019/9/5.
//  Copyright © 2019 Fever. All rights reserved.
//

#import "MFFPreference.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCacheModel : MFFPreference
@property (nonatomic, copy) NSString *feverString;
@property (nonatomic, assign) NSInteger feverInteger;
@property (nonatomic, strong) NSDictionary *feverDict;
@end

NS_ASSUME_NONNULL_END

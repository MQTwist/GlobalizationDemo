//
//  SettingModel.h
//  GlobalizationDemo
//
//  Created by ma qi on 2020/8/20.
//  Copyright © 2020 ma qi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *language;
@property (nonatomic, assign) BOOL select;

@end

NS_ASSUME_NONNULL_END

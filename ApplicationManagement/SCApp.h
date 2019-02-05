//
//  SCApp.h
//  ApplicationManagement
//
//  Created by Stephen Cao on 5/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
-(instancetype)initWithDictionary:(NSDictionary *) dict;
+(instancetype)appWithDictionary:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END

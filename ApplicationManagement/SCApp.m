//
//  SCApp.m
//  ApplicationManagement
//
//  Created by Stephen Cao on 5/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCApp.h"

@implementation SCApp
- (instancetype)initWithDictionary:(NSDictionary *) dict{
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}
+(instancetype)appWithDictionary:(NSDictionary *) dict{
    return [[self alloc]initWithDictionary:dict];
}
@end

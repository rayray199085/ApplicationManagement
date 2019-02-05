//
//  SCAppView.h
//  ApplicationManagement
//
//  Created by Stephen Cao on 5/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCApp.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCAppView : UIView
@property(nonatomic,strong)SCApp *appModel;
+(instancetype)appView;
@end

NS_ASSUME_NONNULL_END

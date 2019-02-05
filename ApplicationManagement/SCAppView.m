//
//  SCAppView.m
//  ApplicationManagement
//
//  Created by Stephen Cao on 5/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCAppView.h"
@interface SCAppView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
- (IBAction)download:(id)sender;

@end
@implementation SCAppView
- (void)setAppModel:(SCApp *)appModel{
    _appModel = appModel;
    self.imageView.image = [UIImage imageNamed:_appModel.icon];
    self.label.text = _appModel.name;
}
+(instancetype)appView{
    NSBundle *rootBundle = [NSBundle mainBundle];
    return [[rootBundle loadNibNamed:@"SCAppView" owner:nil options:nil]lastObject];
}
- (IBAction)download:(id)sender {
    self.downloadBtn.enabled = NO;
    [self.downloadBtn setTitle:@"已下载" forState:UIControlStateDisabled];
    UILabel *alertLabel = [[UILabel alloc]init];
    alertLabel.text = @"下载中......";
    alertLabel.backgroundColor = [UIColor grayColor];
    alertLabel.textColor = [UIColor redColor];
    alertLabel.alpha = 0.0;
    [UIView animateWithDuration:1.5 animations:^{
        alertLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        if(finished){
            [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
                alertLabel.alpha = 0;
            } completion:^(BOOL finished) {
                if(finished){
                    [alertLabel removeFromSuperview];
                }
            }];
        }
    }];
    alertLabel.layer.cornerRadius = 5;
    alertLabel.layer.masksToBounds = YES;
    alertLabel.font = [UIFont boldSystemFontOfSize:17];
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 30;
    CGRect rect = CGRectMake((self.superview.frame.size.width - labelWidth)/2, (self.superview.frame.size.height - labelHeight)/2, labelWidth, labelHeight);
    alertLabel.frame = rect;
    alertLabel.textAlignment = NSTextAlignmentCenter;
    [self.superview addSubview:alertLabel];
//    [alertLabel performSelector:@selector(setAlpha:) withObject:0 afterDelay:1];
    
}
@end

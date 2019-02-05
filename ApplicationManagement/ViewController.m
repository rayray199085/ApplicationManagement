//
//  ViewController.m
//  ApplicationManagement
//
//  Created by Stephen Cao on 5/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "ViewController.h"
#import "SCApp.h"
#import "SCAppView.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *data;
-(void)initView;
-(void)addGrandChildViewTo:(UIView *) view andInfo:(SCApp *)app;
-(void)clickWithButton:(UIButton *)button;
@end

@implementation ViewController
- (NSArray *)data{
    if(_data==nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *appData = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCApp *appInfo = [SCApp appWithDictionary:dict];
            [appData addObject:appInfo];
        }
        _data = appData;
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}
/**
 Initialize subViews and calculate their positions
 */
-(void)initView{
    CGFloat subViewWidth = 75;
    CGFloat subViewHeight = 90;
    int columnCount = 3;
    CGFloat margin = (self.view.frame.size.width - subViewWidth * columnCount) /
                     (columnCount + 1);
    for (int i = 0; i < self.data.count; i++) {
      //        UIView *subView = [[UIView alloc]init];
      //        Create views with xib
        SCAppView *subView = [SCAppView appView];
        CGRect rect = CGRectMake(
          (i % columnCount) * subViewWidth + margin * (i % columnCount + 1),
          (i / columnCount) * subViewHeight + margin * (i / columnCount + 1),
          subViewWidth, subViewHeight);
        subView.frame = rect;
      //        [self addGrandChildViewTo:subView andInfo:self.data[i]];
        SCApp *currentApp = self.data[i];
//        subView.imageView.image = [UIImage imageNamed:currentApp.icon];
//        subView.label.text = currentApp.name;
        subView.appModel = currentApp;
        [self.view addSubview:subView];
    }
}
/**
 Add an imageView, a lable and a button into each subView
 */
-(void)addGrandChildViewTo:(UIView *) view andInfo:(SCApp *)app{
    CGFloat imageWidth = 45;
    int padding = (view.frame.size.width - imageWidth) / 2;
    CGFloat buttonHeight = 20;
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:app.icon];
    CGRect imageRect = CGRectMake(padding, 0, imageWidth, imageWidth);
    imageView.frame = imageRect;
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = app.name;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    CGRect labelRect =  CGRectMake(0, imageWidth, view.frame.size.width, buttonHeight);
    label.frame = labelRect;
    [view addSubview:label];
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"下载" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:@"已安装" forState:UIControlStateDisabled];
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"]
                      forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"]
                      forState:UIControlStateHighlighted];
    CGRect buttonRect = CGRectMake(padding, buttonHeight + imageWidth, imageWidth, buttonHeight);
    button.frame = buttonRect;
    [button addTarget:self action:@selector(clickWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
}
-(void)clickWithButton:(UIButton *)button{
    if(button == nil){
        NSLog(@"none");
    }
    else{
        button.backgroundColor = [UIColor redColor];
    }
}
@end

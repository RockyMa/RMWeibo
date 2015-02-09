//
//  RMTabbarViewController.m
//  RMWeibo
//
//  Created by 马宪天 on 15/2/9.
//  Copyright (c) 2015年 RockyMa. All rights reserved.
//

#import "RMTabbarViewController.h"
#import "RMHomeController.h"
#import "RMMessageController.h"
#import "RMMeController.h"
#import "RMDiscoverController.h"

@interface RMTabbarViewController ()

@end

@implementation RMTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 初始化所有的自控制器
    [self setupAllController];
  
}

// 初始化所有的控制器
- (void)setupAllController
{
    // 1.首页
    RMHomeController *home = [[RMHomeController alloc]init];
    [self setupChildViewController:home title:@"首页" image:@"tabbar_home_os7" selectedImage:@"tabbar_home_selected_os7"];
    
    // 2.消息
    RMMessageController *message = [[RMMessageController alloc]init];
    [self setupChildViewController:message title:@"消息" image:@"tabbar_message_center_os7" selectedImage:@"tabbar_message_center_selected_os7"];
    
    // 3.发现
    RMDiscoverController *discover = [[RMDiscoverController alloc]init];
    [self setupChildViewController:discover title:@"发现" image:@"tabbar_discover_os7" selectedImage:@"tabbar_discover_selected_os7"];
    
    // 4。我
    RMMeController *me = [[RMMeController alloc]init];
    [self setupChildViewController:me title:@"我" image:@"tabbar_profile_os7" selectedImage:@"tabbar_profile_selected_os7"];

}

/**
 设置一个子控制器
 
 ChildController 要设置的子控制器
 title  设置的名称
 image 设置的图片
 selectedImage 被选中的图片
 */
- (void)setupChildViewController:(UITableViewController *)ChildController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置好控制器的标题后，导航控制器和Tab控制器的标题都设好了
    ChildController.title = title;
    ChildController.tabBarItem.image = [UIImage imageNamed:image];
    
    // imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal 会使tabbar选中得图片不再渲染
    ChildController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:ChildController];
    [self addChildViewController:nav];
}



@end

//
//  ViewController.m
//  cgDemo
//
//  Created by 111 on 2021/1/22.
//  Copyright © 2021年 AnySDK. All rights reserved.
//

#import "ViewController.h"
#import "SettingView.h"

#import <cgui/CloudGameHandle.h>
#import <cgSdk/CCGameView.h>

@interface ViewController ()
@property (nonatomic, strong) SettingView *settingView;
@property (nonatomic, strong) UIButton *startGame;
@property (nonatomic, strong) CloudGameHandle *cloudgame;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
     
     {
     // 设置标题栏
     [self setTitle:@"Cocos"];
     UINavigationController *nav = (UINavigationController *)[self parentViewController];
     nav.navigationBar.barTintColor = [UIColor colorWithRed:94/255.0
     green:175/255.0
     blue:211/255.0
     alpha:1.0];
     nav.navigationBar.tintColor = [UIColor whiteColor];
     [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
     }
    
    CGFloat space = 5;
    CGFloat width = self.view.frame.size.width;
    self.startGame = [[UIButton alloc] initWithFrame:CGRectMake(space, 50, width - 2 * space, 44 - 2 * space)];
    [self.startGame setBackgroundColor:[UIColor grayColor]];
    [self.startGame setTitle:@"试玩" forState:UIControlStateNormal];
    
    [self.view addSubview:self.startGame];
    
    [self.startGame addTarget:self action:@selector(onStartGame) forControlEvents:UIControlEventTouchUpInside];
    
    /*self.settingView = [[SettingView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     //[self.settingView setSettingDelegate:self];
     [self.view addSubview:self.settingView];*/
}

- (void)viewDidAppear:(BOOL)animated {
     [self.settingView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
}

- (void)viewDidLayoutSubviews {
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onStartGame {
    // Use RootViewController to manage CCEAGLView
    NSDictionary *dic = @{
                          CC_KEY_BSURL: @"http://test-cg.cocosgame.com/bs/",
                          CC_KEY_LOCATION: @"福建/电信",
                          CC_KEY_TOKEN: @"4f1d4e68bd69fcba65d481b13812034c02faea363dfde2230ad1ae40b463c0a2669a3ad1f1162de8dcc75d42fa0a3f",
                          CC_KEY_GAMEPACKAGE: @"com.tencent.tmgp.sgame/com.tencent.tmgp.sgame.SGameActivity",
                          CC_KEY_GAMENAME: @"王者荣耀",
                          CC_KEY_COCOSID: @"",
                          CC_KEY_GSID: @"5D62104858ED1568",
                          CC_KEY_USERID: @"F1ED35DB-5BE5-4AC2-8629-96FFA93853A5",
                          CC_KEY_CHANNELID: @"EB37A76024660EB3",
                          CC_KEY_ENGINEER: @"YES"};
     self.cloudgame = [[CloudGameHandle alloc] initWithGameInfo:dic];
     self.cloudgame.modalPresentationStyle = UIModalPresentationFullScreen;
     [self presentViewController:self.cloudgame animated:YES completion:nil];
    
}


@end

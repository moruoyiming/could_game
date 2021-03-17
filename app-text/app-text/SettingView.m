//
//  settingView.m
//  cgDemo
//
//  Created by 111 on 2021/1/26.
//  Copyright © 2021年 AnySDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingView.h"

#import <cgui/CloudGameHandle.h>
#import <cgSdk/CCGameView.h>

@interface SettingView () //<UITableViewDelegate, UITableViewDataSource>, _SettingViewCellDelegate>
//@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, copy) NSArray<SettingViewModel *> *dataSource;
@property (nonatomic, strong) UIButton *startGame;
@property (nonatomic, strong) CloudGameHandle *cloudgame;
//@property (nonatomic, strong) MessagePickerView *pickerView;
//Add chenhy
//@property (nonatomic, strong) UILabel *versionLable;
@end


@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initWithFrame:frame];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

/*- (void)setSettingDelegate:(id<SettingViewDelegate>)settingDelegate {
    _settingDelegate = settingDelegate;
    // 获取数据
    self.dataSource = [self.settingDelegate getSettingModel];
    [self.startGame addTarget:self.settingDelegate action:@selector(onStartGame) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView reloadData];
}*/



#pragma mark - private
- (void)_initWithFrame:(CGRect)frame {
    
    /*self.tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
    [self.tableView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[_SettingViewCell class] forCellReuseIdentifier:_CELL_IDENTIFIER];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_CELL_NORMAL_IDENTIFIER];
    [self.tableView setTableFooterView:[UIView new]];
    [self addSubview:self.tableView];*/
    
    CGFloat space = 5;
    CGFloat width = frame.size.width;
    self.startGame = [[UIButton alloc] initWithFrame:CGRectMake(space, 50, width - 2 * space, 44 - 2 * space)];
    [self.startGame setBackgroundColor:[UIColor grayColor]];
    [self.startGame setTitle:@"试玩" forState:UIControlStateNormal];
    
    [self addSubview:self.startGame];
    
    [self.startGame addTarget:self action:@selector(onStartGame) forControlEvents:UIControlEventTouchUpInside];
    
    /*NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *buildData = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBuildDate"]substringFromIndex:7];

    NSLog(@"version = %@, build = %@, time_now = %@", version, buildversion, buildData);
    //CGFloat height = frame.size.height;
    self.versionLable = [[UILabel alloc] initWithFrame:CGRectMake(space, 44 - space, width, 50)];
    //[self.versionLable setBackgroundColor:[UIColor grayColor]];
    self.versionLable.text = [NSString stringWithFormat:@"version: v%@-%@-%@",  version, buildversion, buildData];
    self.versionLable.textColor = [UIColor redColor];*/
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
     CC_KEY_CHANNELID: @"AD8913UY1849A92C",
     CC_KEY_ENGINEER: @"YES"};
    self.cloudgame = [[CloudGameHandle alloc] initWithGameInfo:dic];
}

@end

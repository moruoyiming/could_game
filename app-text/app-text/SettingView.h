//
//  settingView.h
//  cgDemo
//
//  Created by 111 on 2021/1/26.
//  Copyright © 2021年 AnySDK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*typedef NS_ENUM (NSUInteger, SettingViewType) {
    SettingViewTypeGameName = 0,
    SettingViewTypeChannelId,
    SettingViewTypeBSURL,
    SettingViewTypeLocation,
    SettingViewTypeUserId,
    SettingViewTypeGSId,
    SettingViewTypeUAName
};

@interface SettingViewModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) SettingViewType type;
@end

@protocol SettingViewDelegate <NSObject>

- (void)onStartGame;

- (NSArray *)onGetSettingDataSourceWithType:(SettingViewType)type;

- (void)onSettingChangeWithType:(SettingViewType)type content:(NSString *)content;

- (NSArray<SettingViewModel *> *)getSettingModel;

@end*/

@interface SettingView : UIView
//@property (nonatomic, weak) id<SettingViewDelegate> settingDelegate;
@end

NS_ASSUME_NONNULL_END

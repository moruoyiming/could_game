//
//  CCGameView.h
//  cocos-cloud-game
//
//  Created by weidazhang on 2019/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const CC_KEY_BSURL = @"KEY_BSURL";
static NSString * const CC_KEY_LOCATION = @"KEY_LOCATION";
static NSString * const CC_KEY_ENGINEER = @"KEY_ENGINEER";

static NSString * const CC_KEY_TOKEN = @"KEY_TOKEN";
static NSString * const CC_KEY_GAMEPACKAGE = @"KEY_GAMEPACKAGE ";
static NSString * const CC_KEY_USERID = @"KEY_USERID";
static NSString * const CC_KEY_CHANNELID = @"KEY_CHANNELID";
static NSString * const CC_KEY_GAMENAME = @"KEY_GAMENAME";
static NSString * const CC_KEY_COCOSID = @"KEY_COCOSID";
static NSString * const CC_KEY_GSID = @"KEY_GSID";

@protocol CCConnectState <NSObject>

/*
 *  用户信息校验结束，开始连接
 */
- (void)onStartConnect;

/*
 * 包含两种情况：
 * 1. BS/MS/GS 连接失败，重新建连;
 * 2. GS连接成功之后出现断开，重新连接
 */
- (void)onStartReconnect;

/*
 *  成功连接上链路，开始正常运行
 */
- (void)onConnectSuccess;

/*
 *  BS/MS/GS 连接失败
 */
- (void)onConnectFail;

/*
 *  运行云游戏时出现disconnect现象
 */
- (void)onDisConnect;

/*
 *  成功连上链路，迎来第一帧数据
 */
- (void)onGameFirstFrameReady;

/*
 *  退出连接
 */
- (void)onQuitConnect;

@end

@protocol CCDebugInfo <NSObject>
/*
 * 状态、网络信息
 * status：信息数据*/
- (void)rtcStateInfo:(NSDictionary *)info;

/*
 * UI界面客户端数据
 * infos：封装的数据信息*/
- (void)serverInfo:(NSDictionary *)info;

@end

@protocol CCDeviceState <NSObject>
/*
 * 网络状态
 * state：7;//wifi on
 * 8;//wifi off
 * 9;//no net work
 * */
- (void)onNetWorkChange:(int)state;

/*
 * 云端游戏横竖屏信息回调
 * orientation：landscape是横向，portrait是纵向
 * */
- (void)onScreenOrientationConfigured:(NSString *)orientation;

/*
 * 游戏View界面点击
 * */
- (void)onRemoteViewTouch;

@end

@protocol CCGameState <NSObject>

- (void)totalTime:(int)time;

- (void)timeOver;

- (void)remainTime:(int)time;

- (void)timeAlmostOverPrompt;

- (void)noPlayTime;

//Add by chenhy
- (void)gameNonexistence;
//Add by chenhy
- (void)channalNonexistence;
- (void)authenticationFailed;
- (void)noFlow;

//Add by chenhy
- (void)reconnectGame;

- (void)connectedFailed;

- (void)resumeGame;

/*
 * 游戏再次上线所需等待时间,时间为毫秒
 */
- (void)timeWaitForOnline:(long)ucTime;

@end

@protocol CCQueueState <NSObject>

/*
 * 排队人数，目前所处位置，后台如果有链路排队位置会不执行
 * */
- (void)queuePosition:(int)position;

/*
 * 排队结束
 * */
- (void)queueEnd;

@end

@interface CCGameView : UIView
@property (nonatomic, weak) id<CCConnectState> connectDelegate;
@property (nonatomic, weak) id<CCDebugInfo> debugInfoDelegate;
@property (nonatomic, weak) id<CCDeviceState> deviceDelegate;
@property (nonatomic, weak) id<CCGameState> gameDelegate;
@property (nonatomic, weak) id<CCQueueState> queueDelegate;
@property (nonatomic, assign, readonly) BOOL hasStarted;

- (void)start:(NSDictionary *)info;

- (void)pause;

- (void)resume;

- (void)stopGameConnectClient;

//add by chenhy
- (void)showTimeCalculate:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END

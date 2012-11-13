// Author: qianjin
// Date:   2012-11-1
// 一些宏定义
//  
#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define EMPTY_STRING        @""

#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 *常量
 */
// UIConstants provides contants variables for UI control.
#define UI_NAVIGATION_BAR_HEIGHT    44
#define UI_TAB_BAR_HEIGHT           49
#define UI_STATUS_BAR_HEIGHT        20
#define UI_SCREEN_WIDTH             320
#define UI_SCREEN_HEIGHT            480

#define UI_LABEL_LENGTH             200
#define UI_LABEL_HEIGHT             15
#define UI_LABEL_FONT_SIZE          12
#define UI_BUTTON_HEIGHT            35
#define UI_LABEL_FONT               [UIFont systemFontOfSize:UI_LABEL_FONT_SIZE]

//http://192.168.2.176:9502/api/vas_list.php?openid=215715a150f27ef36a992ba8f9c0b70d&typeid=193&listType=1&start=0&limit=20
//#define HOST_NAME         @"192.168.2.176:9502/api"//xs.zj165.com/API

#define HOST_NAME         @"xs.zj165.com"

/**
 *一些中文定义
 */
#define ROOT_VIEW_RIGHT_BTN         @"登  录"
#define POHONE_NUM_IS_NULL          @"手机号为空！"
#define CONFIRM_PASSWORD_IS_NULL    @"确认密码为空！"
#define VERIFICATION_CODE_IS_NULL   @"验证码为空！"

/**
 *枚举
 */
typedef enum {
	WEB_VIEW = 0,			//当前为登录界面
    MAP_VIEW
	
} CurrentViewType;


typedef enum{
	ProcessNone=0,//无
	ProcessDefault=1,//默认效果  黑色遮盖  
	ProcessSimple=2,//一般  只有转圈
} ProcessType;

/*
 *  System Versioning Preprocessor Macros
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/*
 Usage sample:
 
 if (SYSTEM_VERSION_LESS_THAN(@"4.0")) {
 ...
 }
 
 if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"3.1.1")) {
 ...
 }
 
 */
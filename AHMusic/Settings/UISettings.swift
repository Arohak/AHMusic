//
//  UISettings.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let rootVC = appDelegate.window?.rootViewController as! UINavigationController

//MARK: - ScreenSize

struct ScreenSize
{
    static let WIDTH                = UIScreen.mainScreen().bounds.size.width
    static let HEIGHT               = UIScreen.mainScreen().bounds.size.height
    static let MAX_LENGTH           = max(ScreenSize.WIDTH, ScreenSize.WIDTH)
    static let MIN_LENGTH           = min(ScreenSize.HEIGHT, ScreenSize.HEIGHT)
}

//MARK: - DeviceType

enum DeviceType
{
    static let IS_IPHONE                = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH < 568.0
    static let IS_IPHONE_5              = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 568.0
    static let IS_IPHONE_6              = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 667.0
    static let IS_IPHONE_6P             = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MAX_LENGTH == 736.0
    static let IS_IPAD                  = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.MAX_LENGTH == 1024.0
}

//MARK: - System Version

struct Version
{
    static let SYS_VERSION_FLOAT        = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    static let iOS8                     = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9                     = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}

//MARK: - Multiplier

let IPHONE_4_SCALE : CGFloat            = 480  / 736
let IPHONE_5_SCALE : CGFloat            = 568  / 736
let IPHONE_6_SCALE : CGFloat            = 667  / 736
let IPAD_SCALE : CGFloat                = 1024 / 736

//MARK: - All Colors

let GREEN                               = UIColor(red: 137/255,     green: 212/255,     blue: 57/255,       alpha: 1)
let BLUE_LIGHT                          = UIColor(red: 51/255,      green: 204/255,     blue: 255/255,      alpha: 1)
let XAKI                                = UIColor(red: 255/255,     green: 102/255,     blue: 51/255,       alpha: 1)
let GRAY_164                            = UIColor(red: 164/255,     green: 164/255,     blue: 164/255,      alpha: 1)
let GRAY_200                            = UIColor(red: 200/255,     green: 200/255,     blue: 200/255,      alpha: 1)
let GRAY_119                            = UIColor(red: 119/255,     green: 119/255,     blue: 119/255,      alpha: 1)
let BLACK_59                            = UIColor(red: 59/255,      green: 59/255,      blue: 59/255,       alpha: 1)
let BLUE                                = UIColor(red: 24/255,      green: 75/255,      blue: 152/255,      alpha: 1)
let BLACK                               = UIColor.blackColor()
let WHITE                               = UIColor.whiteColor()
let GRAY                                = UIColor.grayColor()
let CLEAR                               = UIColor.clearColor()
let RCOLORS                             = [UIColor.blueColor(), UIColor.redColor(), UIColor.orangeColor(), UIColor.greenColor()]

//MARK: - All Pages

typealias PickerCallback                = (value: String) -> Void

let FONT_NAVBAR                         = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25 : 18)
let TOP_INSET : CGFloat                 = DeviceType.IS_IPAD ? 35     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 35     : DeviceType.IS_IPHONE_6 ? 35   * IPHONE_6_SCALE : 35   * IPHONE_5_SCALE
let LINK_FONT                           = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 14         * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_SCALE)

//MARK: - Base Constants

let BA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let TITLE_BTN_FONT                      = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Slide Constants

let WIDTH : CGFloat                     = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_SCALE


//MARK: - LeftMenu Constants

let LM_INSET : CGFloat                  = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE
let LM_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 4      * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 4      : DeviceType.IS_IPHONE_6 ? 4    * IPHONE_6_SCALE : 4    * IPHONE_5_SCALE
let LM_LBL_FONT                         = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 12         * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_SCALE)

//MARK: - Category Constants

let CA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let CA_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let CA_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let CA_CELL_WIDTH : CGFloat             = (ScreenSize.WIDTH - 4*CA_INSET)/2

let CA_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 25     : DeviceType.IS_IPHONE_6 ? 25   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)

//MARK: - Album Constants

let AL_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let AL_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let AL_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 180    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 180    : DeviceType.IS_IPHONE_6 ? 180  * IPHONE_6_SCALE : 180  * IPHONE_5_SCALE

let AL_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Artist Constants

let AR_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let AR_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let AR_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let AR_CELL_WIDTH : CGFloat             = (ScreenSize.WIDTH - 6*AR_INSET)/3

let AR_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Playlist Constants

let PL_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let PL_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let PL_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let PL_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 120    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 120    : DeviceType.IS_IPHONE_6 ? 120  * IPHONE_6_SCALE : 120  * IPHONE_5_SCALE

let PL_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 18   * IPHONE_5_SCALE)
let PL_DATE_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Track Constants

let TR_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let TR_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let TR_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let TR_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 150    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 150    : DeviceType.IS_IPHONE_6 ? 150  * IPHONE_6_SCALE : 150  * IPHONE_5_SCALE
let TR_IMG_WIDTH : CGFloat              = ScreenSize.WIDTH*0.35

let TR_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)
let TR_DESC_FONT                        = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Detail Constants

let DE_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 60     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 60     : DeviceType.IS_IPHONE_6 ? 60   * IPHONE_6_SCALE : 60   * IPHONE_5_SCALE
let DE_HEADER_HEIGHT : CGFloat          = ScreenSize.HEIGHT*0.6

let DE_INFO_FONT                        = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - TrackDetail Constants

let TD_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let TD_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let TD_BTN_SIZE : CGFloat               = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE
let TD_BBTN_SIZE : CGFloat              = DeviceType.IS_IPAD ? 45     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 45     : DeviceType.IS_IPHONE_6 ? 45   * IPHONE_6_SCALE : 45   * IPHONE_5_SCALE
let TD_HEIGHT : CGFloat                 = TD_BBTN_SIZE*4.5
//let TD_HEIGHT : CGFloat                 = ScreenSize.HEIGHT*0.3

let TD_DATE_FONT                        = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 14      * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_SCALE)
let TD_TIME_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 14          * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_SCALE)



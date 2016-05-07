//
//  UISettings.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

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
let BLACK                               = UIColor.blackColor()
let WHITE                               = UIColor.whiteColor()
let GRAY                                = UIColor.grayColor()
let CLEAR                               = UIColor.clearColor()

//MARK: - All Pages

//typealias block                         = (value: Weather) -> Void
typealias blockUpdate                   = (city: String) -> Void

let FONT_NAVBAR                         = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25 : 18)
let TOP_INSET : CGFloat                 = DeviceType.IS_IPAD ? 35     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 35     : DeviceType.IS_IPHONE_6 ? 35   * IPHONE_6_SCALE : 35   * IPHONE_5_SCALE

//MARK: - Base Constants

let BA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let TITLE_LBL_FONT                      = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)
let TITLE_BTN_FONT                      = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 16     : DeviceType.IS_IPHONE_6 ? 16   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)

//MARK: - Landing Constants

let LA_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_SCALE
let LA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let LA_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 6      * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 6      : DeviceType.IS_IPHONE_6 ? 6    * IPHONE_6_SCALE : 6    * IPHONE_5_SCALE
let LA_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 220    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 220    : DeviceType.IS_IPHONE_6 ? 220  * IPHONE_6_SCALE : 220  * IPHONE_5_SCALE
let LA_LBL_FONT                         = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_SCALE)

//MARK: - Detail Constants

let DE_INSET : CGFloat                  = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_SCALE
let DE_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE
let DE_TOP_HEIGHT : CGFloat             = DeviceType.IS_IPAD ? 370    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 370    : DeviceType.IS_IPHONE_6 ? 370  * IPHONE_6_SCALE : 370  * IPHONE_5_SCALE
let DE_BOTTOM_HEIGHT : CGFloat          = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_SCALE
let DE_DAY_CELL_HEIGHT : CGFloat        = DeviceType.IS_IPAD ? 45     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 45     : DeviceType.IS_IPHONE_6 ? 45   * IPHONE_6_SCALE : 45   * IPHONE_5_SCALE
let DE_TIME_CELL_SIZE : CGFloat         = DeviceType.IS_IPAD ? 75     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 75     : DeviceType.IS_IPHONE_6 ? 75   * IPHONE_6_SCALE : 75   * IPHONE_5_SCALE
let DE_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_SCALE
let DE_BTN_SIZE : CGFloat               = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_SCALE

let DE_NAME_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_SCALE)
let DE_TITLE_FONT                       = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 18   * IPHONE_5_SCALE)
let DE_TEMP_FONT                        = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 150    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 150    : DeviceType.IS_IPHONE_6 ? 150  * IPHONE_6_SCALE : 150  * IPHONE_5_SCALE)

//MARK: - Map Constants

let MA_RADIUS : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let MA_BTN_HEIGHT : CGFloat             = DeviceType.IS_IPAD ? 45     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 45     : DeviceType.IS_IPHONE_6 ? 45   * IPHONE_6_SCALE : 45   * IPHONE_5_SCALE


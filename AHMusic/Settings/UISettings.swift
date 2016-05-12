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
let BLUE                                = UIColor(red: 24/255,      green: 75/255,      blue: 152/255,      alpha: 1)
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

//MARK: - Category Constants

let CA_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let CA_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let CA_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let CA_CELL_WIDTH : CGFloat             = (ScreenSize.WIDTH - 4*CA_INSET)/2

let CA_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 25     : DeviceType.IS_IPHONE_6 ? 25   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)

//MARK: - Track Constants

let TR_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_SCALE
let TR_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE
let TR_ICON_SIZE : CGFloat              = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_SCALE
let TR_CELL_HEIGHT : CGFloat            = DeviceType.IS_IPAD ? 100    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 100    : DeviceType.IS_IPHONE_6 ? 100  * IPHONE_6_SCALE : 100  * IPHONE_5_SCALE
let TR_IMG_WIDTH : CGFloat              = ScreenSize.WIDTH*0.3

let TR_TITLE_FONT                       = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 25     : DeviceType.IS_IPHONE_6 ? 25   * IPHONE_6_SCALE : 20   * IPHONE_5_SCALE)
let TR_DESC_FONT                        = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 16   * IPHONE_5_SCALE)


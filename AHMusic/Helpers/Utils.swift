//
//  Utils.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

struct Utils {
    
    static func stringFromDateString(dateString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.dateFromString(dateString as String)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = date {
            return dateFormatter.stringFromDate(date)
        } else {
            return ""
        }
    }
    
    static func getWeekString(dateString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(dateString as String)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.stringFromDate(date!)
    }
    
    static func formateString(number: String) -> String {
        let formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.paddingPosition = NSNumberFormatterPadPosition.BeforePrefix
        formatter.paddingCharacter = "0"
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let num = formatter.numberFromString(number)

        return num == nil ? "" : formatter.stringFromNumber(num!)!
    }
    
    static func favoriteState(track: Track) -> Bool {
        let storedFavoriteTrackers = Array(dbHelper.getFavoriteTracks())
        let tr = storedFavoriteTrackers.filter() { $0.id == track.id }.first
        if let tr = tr where tr.favorite {
            return true
        } else {
            return false
        }
    }
    
    static func downloadState(track: Track) -> Bool {
        let storedDownloadTrackers = Array(dbHelper.getDownloadedTracks())
        let tr = storedDownloadTrackers.filter() { $0.id == track.id }.first
        if let tr = tr where tr.download {
            return true
        } else {
            return false
        }
    }
    
    static func getDocumentsFolderPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    }
    
    static func writeToSelectedTrack(path: String, trackID: String) {
        let destinationPath = self.getDocumentsFolderPath() + "/" + trackID
        if let data = NSData(contentsOfURL: NSURL(string: path)!) {
            try! data.writeToFile(destinationPath, options: .DataWritingWithoutOverwriting)
        }
    }
    
    static func removeTrackIfExist(track: Track) {
        let name = track.preview.componentsSeparatedByString("/").last!
        let destinationPath = self.getDocumentsFolderPath() + "/" + name
        if NSFileManager.defaultManager().fileExistsAtPath(destinationPath) {
            try!  NSFileManager.defaultManager().removeItemAtPath(destinationPath)
        }
    }
}


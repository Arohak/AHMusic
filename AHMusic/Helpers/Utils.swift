//
//  Utils.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

struct Utils {
    
    static func stringFromDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString as String)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = date {
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    static func getWeekString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString as String)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date!)
    }
    
    static func formateString(_ number: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.paddingPosition = .beforePrefix
        formatter.paddingCharacter = "0"
        formatter.numberStyle = .decimal
        let num = formatter.number(from: number)

        return num == nil ? "" : formatter.string(from: num!)!
    }
    
    static func favoriteState(_ track: Track) -> Bool {
        let storedFavoriteTrackers = Array(dbHelper.getFavoriteTracks())
        let tr = storedFavoriteTrackers.filter() { $0.id == track.id }.first
        if let tr = tr, tr.favorite {
            return true
        } else {
            return false
        }
    }
    
    static func downloadState(_ track: Track) -> Bool {
        let storedDownloadTrackers = Array(dbHelper.getDownloadedTracks())
        let tr = storedDownloadTrackers.filter() { $0.id == track.id }.first
        if let tr = tr, tr.download {
            return true
        } else {
            return false
        }
    }
    
    static func getDocumentsFolderPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    static func writeToSelectedTrack(_ path: String, trackID: String) {
        let destinationPath = self.getDocumentsFolderPath() + "/" + trackID
        if let data = NSData(contentsOf: NSURL(string: path)! as URL) {
            try! data.write(toFile: destinationPath, options: .withoutOverwriting)
        }
    }
    
    static func removeTrackIfExist(_ track: Track) {
        let name = track.preview.components(separatedBy: "/").last!
        let destinationPath = self.getDocumentsFolderPath() + "/" + name
        if FileManager.default.fileExists(atPath: destinationPath) {
            try!  FileManager.default.removeItem(atPath: destinationPath)
        }
    }
}


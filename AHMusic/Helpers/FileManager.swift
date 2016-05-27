//
//  FileManager.swift
//  AHMusic
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//import Alamofire
//
//let fileManager = FileManager.sharedInstance
//
//class FileManager {
//    
//    static let sharedInstance = LocationHelper()
//    
//    var downloadedTracks = Array<Track>()
//    var downloadingTracks = Array<Track>()
//    
//    func getInProgressTracks() -> Array<Track> {
//        
//        return self.downloadingTracks
//    }
//    
//    func startDownloadingTrack(track : Track) {
//        
//        self.downloadingTracks.append(track)
//    }
//    
//    func removeDownloadedTrack(track : Track) {
//        
//        self.files.removeAtIndex(self.track.indexOf { $0.name == file.name }!)
//    }
//    
//    func cancelDownloadedTrack(track : Track) {
//        
//        track.request.cancel()
//    }
//
//    func isAlreadyStartDownloadFile(name: String) -> Bool {
//        
//        for file in self.files {
//            if (file.name == name) {
//                return true
//            }
//        }
//        
//        return false
//    }
//}

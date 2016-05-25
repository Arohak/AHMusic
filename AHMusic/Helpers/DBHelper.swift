//
//  DBHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

let dbHelper = DBHelper.sharedInstance

class DBHelper {
    
    static let sharedInstance = DBHelper()
    var realmFavorite: Realm!
    var realmDownload: Realm!

    private init() {
        realmFavorite = try! Realm()
        realmDownload = try! Realm()
//        realmDownload = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "RealmDownloadIdentifier"))
    }
    
    private func setDefaultRealmForUser(username: String) {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?.URLByAppendingPathComponent("\(username).realm")
        Realm.Configuration.defaultConfiguration = config
    }
    
    //MARK: - Track Favorite -
    func getFavoriteTracks() -> Results<Track> {
        let tracks = realmFavorite.objects(Track.self).filter("favorite == true")

        return tracks
    }

    func addOrDeleteFavoriteTrack(state: Bool, track: Track) {
        if state {
            try! realmFavorite.write {
                let item = realmFavorite.create(Track.self, value: track, update: true)
                
                item.favorite = true
                realmFavorite.add(item)
            }
        } else {
            try! realmFavorite.write {
                let item = realmFavorite.create(Track.self, value: track, update: true)

                item.favorite = false
                realmFavorite.delete(item)
            }
        }
        
        print("Favorite")
        print(getFavoriteTracks().count)
    }
    
    func searchFavoriteTracks(keyword: String) -> Results<Track> {
        let predicate = NSPredicate(format: "title contains[c] %@", keyword)
        let tracks = realmFavorite.objects(Track.self).filter(predicate)
        
        return tracks
    }
    
    //MARK: - Track Download -
    func getDownloadedTracks() -> Results<Track> {
        let tracks = realmDownload.objects(Track.self).filter("download == true")
        
        return tracks
    }
    
    func addOrDeleteDownloadTrack(state: Bool, track: Track) {
        if state {
            try! realmDownload.write {
                let item = realmDownload.create(Track.self, value: track, update: true)
                
                item.download = true
                realmDownload.add(item)
            }
        } else {
            try! realmDownload.write {
                let item = realmDownload.create(Track.self, value: track, update: true)
                
                item.download = false
                realmDownload.delete(item)
            }
        }
        
        print("Downloaded")
        print(getDownloadedTracks().count)
    }
    
    func searchDownloadTracks(keyword: String) -> Results<Track> {
        let predicate = NSPredicate(format: "title contains[c] %@", keyword)
        let tracks = realmDownload.objects(Track.self).filter(predicate)
        
        return tracks
    }
}

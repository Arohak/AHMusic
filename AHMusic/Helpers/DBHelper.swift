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
    var realm: Realm!

    private init() {
        realm = try! Realm()
//        realmDownload = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "RealmDownloadIdentifier"))
    }
    
    private func setDefaultRealmForUser(username: String) {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?.URLByAppendingPathComponent("\(username).realm")
        Realm.Configuration.defaultConfiguration = config
    }
    
    //MARK: - Track Favorite -
    func getFavoriteTracks() -> Results<Track> {
        let tracks = realm.objects(Track.self).filter("favorite == true")

        return tracks
    }
    
    func addOrDeleteFavoriteTrack(state: Bool, track: Track) {
        let predicate = NSPredicate(format: "id = %i", track.id)
        let tr = realm.objects(Track.self).filter(predicate).first
        
        if state {
            try! realm.write {
                if tr == nil {
                    let item = realm.create(Track.self, value: track, update: true)
                    
                    item.favorite = state
                    realm.add(item, update: true)
                } else {
                    tr!.favorite = state
                }
            }
        } else {
            try! realm.write {
                tr!.favorite = state
            }
        }
        
//        print("Favorite")
//        print(getFavoriteTracks().count)
    }
    
    func searchFavoriteTracks(keyword: String) -> Results<Track> {
        let predicate = NSPredicate(format: "title contains[c] %@", keyword)
        let tracks = realm.objects(Track.self).filter(predicate)
        
        return tracks
    }
    
    //MARK: - Track Download -
    func getDownloadedTracks() -> Results<Track> {
        let tracks = realm.objects(Track.self).filter("download == true")
        
        return tracks
    }
    
    func addOrDeleteDownloadTrack(state: Bool, track: Track) {
        let predicate = NSPredicate(format: "id = %i", track.id)
        let tr = realm.objects(Track.self).filter(predicate).first
        
        if state {
            try! realm.write {
                if tr == nil {
                    let item = realm.create(Track.self, value: track, update: true)
                    
                    item.download = state
                    realm.add(item, update: true)
                } else {
                    tr!.download = state
                }
            }
        } else {
            try! realm.write {
                tr!.download = state
            }
        }
        
//        print("Download")
//        print(getDownloadedTracks().count)
    }
    
    func searchDownloadTracks(keyword: String) -> Results<Track> {
        let predicate = NSPredicate(format: "title contains[c] %@", keyword)
        let tracks = realm.objects(Track.self).filter(predicate)
        
        return tracks
    }
}

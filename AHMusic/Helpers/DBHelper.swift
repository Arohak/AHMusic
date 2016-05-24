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
    }
    
    //MARK: - Track -
    func getFavoriteTracks() -> Results<Track> {
        let tracks = realm.objects(Track.self).filter("favorite == true")
        
        return tracks
    }
    
    func addOrDeleteTrack(track: Track, state: Bool) {
        if state {
            try! realm.write {
                let item = realm.create(Track.self, value: track, update: true)
                
                track.favorite = state
                realm.add(item)
            }
        } else {
            try! realm.write {
                let item = realm.create(Track.self, value: track, update: true)

                track.favorite = state
                realm.delete(item)
            }
        }
    }
}

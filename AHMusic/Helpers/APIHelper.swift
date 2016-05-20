//
//  APIHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

let apiHelper = APIHelper.sharedInstance

class APIHelper {
    
    static let sharedInstance = APIHelper()
    let manager = Manager.sharedInstance
    
    //MARK: - API Routers
    private struct ROUTERS
    {
        //http://www.last.fm/api
//        static let ROOT_URL                = "http://ws.audioscrobbler.com/2.0/"
//        static let API_VALUE               = "5c1a64ac9d59273b95165bd369b15fdb"
//        static let GET_TOP_TAGS            = "chart.getTopTags"
//        static let GET_TOP_ALBUMS          = "artist.getTopAlbums"
//        static let GET_TOP_ARTISTS         = "tag.getTopArtists"
//        static let GET_TRACKS              = "album.getInfo"
        
        //https://market.mashape.com/deezerdevs/deezer#-search
//        static let ROOT_URL                 = "https://deezerdevs-deezer.p.mashape.com/"
        static let ROOT_URL                 = "http://api.deezer.com/"
        static let HEADER                   = ["X-Mashape-Key": "4LayNni55YmshxhVWWnUNiryZGFPp1ULxlEjsnxLhL7PonxZ1M", "Accept": "text/plain"]
        static let GET_GENRE                = "genre"
        static let GET_ALBUM                = "album/%@"
        static let GET_ARTIST               = "artist/%@"
        static let GET_PLAYLIST             = "playlist/%@"
        static let GET_TRACK                = "track/%@"
        
        static let SEARCH                   = "search?q=%@"
        static let SEARCH_ALBUM             = "search/album?q=%@"
        static let SEARCH_ARTIST            = "search/artist?q=%@"
        static let SEARCH_PLAYLIST          = "search/playlist?q=%@"
        static let SEARCH_TRACK             = "search/track?q=%@"

        static let GET_ARTIST_TRACKS        = "artist/%@/top?limit=%@"
        static let GET_ALBUM_TRACKS         = "album/%@/tracks"
    }
    
    private func rx_Request(method: Alamofire.Method,
                            url: String,
                            parameters: [String: AnyObject]? = nil,
                            showProgress: Bool = true,
                            isHeader: Bool = true)
                            -> Observable<JSON>
    {
        return Observable.create { observer in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//            if showProgress { UIHelper.showProgressHUD() }
            if showProgress { UIHelper.showSpinner() }

            let URL = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            let header = isHeader ? ROUTERS.HEADER : [:]
            _ = self.manager.rx_request(method, URL, parameters: parameters, encoding: .URL, headers: header)
                .observeOn(MainScheduler.instance)
                .flatMap {
                    $0.rx_JSON()
                }
                .subscribe(
                    onNext: {
                        observer.onNext(JSON($0))
                    },
                    onError: {
                        observer.onError($0)
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                        if showProgress { UIHelper.hideProgressHUD() }
                        if showProgress { UIHelper.hideSpinner() }
                        UIHelper.showHUD("error")
                    },
                    onCompleted: {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                        if showProgress { UIHelper.hideProgressHUD() }
                        if showProgress { UIHelper.hideSpinner() }
                        observer.onCompleted()
                    })
            
            return AnonymousDisposable { }
        }
    }
    
    //MARK: - Categories
    func rx_GetCategories() -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + ROUTERS.GET_GENRE
        return rx_Request(.GET, url: url)
    }
    
    //MARK: - Search for Name
    func rx_SearchAlbum(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH_ALBUM, name)
        return rx_Request(.GET, url: url)
    }
    
    func rx_SearchArtist(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH_ARTIST, name)
        return rx_Request(.GET, url: url)
    }
    
    func rx_SearchpPlaylist(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH_PLAYLIST, name)
        return rx_Request(.GET, url: url)
    }
    
    func rx_SearchpTrack(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH_TRACK, name)
        return rx_Request(.GET, url: url)
    }

    func rx_Search(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH, name)
        return rx_Request(.GET, url: url)
    }
    
    //MARK: - GET for ID
    func rx_GetAlbum(id: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.GET_ALBUM, id)
        return rx_Request(.GET, url: url)
    }
    
    func rx_GetArtist(id: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.GET_ARTIST, id)
        return rx_Request(.GET, url: url)
    }
    
    func rx_GetArtistTracks(id: String, limit: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.GET_ARTIST_TRACKS, id, limit)
        return rx_Request(.GET, url: url)
    }
    
    func rx_GetPlaylist(id: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.GET_PLAYLIST, id)
        return rx_Request(.GET, url: url)
    }
    
    func rx_GetTrack(id: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.GET_TRACK, id)
        return rx_Request(.GET, url: url)
    }
}

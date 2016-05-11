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
        static let ROOT_URL                 = "https://deezerdevs-deezer.p.mashape.com/"
        static let headers                  = ["X-Mashape-Key": "4LayNni55YmshxhVWWnUNiryZGFPp1ULxlEjsnxLhL7PonxZ1M", "Accept": "text/plain"]
        static let SEARCH                   = "search?q=%@"
        static let GET_ALBUM                = "album/"
        static let GET_ARTIST               = "artists/"
        static let GET_PLAYLIST             = "playlist/"
        static let GET_TRACK                = "track/"
    }
    
    private func rx_Request(method: Alamofire.Method,
                            url: String,
                            parameters: [String: AnyObject]? = nil,
                            showProgress: Bool = true,
                            isHeader: Bool = false)
                            -> Observable<JSON>
    {
        return Observable.create { observer in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            if showProgress { UIHelper.showProgressHUD() }
            
            let URL = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//            URL = URL + "&api_key=\(ROUTERS.API_VALUE)&format=json"
            let header = isHeader ? ROUTERS.headers : [:]
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
                        if showProgress { UIHelper.hideProgressHUD() }
                        UIHelper.showHUD("error")
                    },
                    onCompleted: {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                        if showProgress { UIHelper.hideProgressHUD() }
                        observer.onCompleted()
                    })
            
            return AnonymousDisposable { }
        }
    }

    func rx_Search(name: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SEARCH, name)
        return rx_Request(.GET, url: url, isHeader: true)
    }
    
    func rx_GetAlbum(id: String) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + ROUTERS.GET_ALBUM + id
        return rx_Request(.GET, url: url, isHeader: true)
    }
}

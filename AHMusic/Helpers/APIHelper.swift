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
    
    //MARK: - API Routers -
    private struct ROUTERS {
        
        static let ROOT_URL                 = "http://ahmusic.herokuapp.com/api/v1/"
        static let SIGNIN                   = "profiles/signin?email=%@&password=%@"
        static let SIGNUP                   = "profiles/signup?name=%@&email=%@&password=%@&password_confirmation=%@"
        
        static let GET_GENRE                = "genres"
        static let GET_ALBUM                = "albums/%@"
        static let GET_ARTIST               = "artists/%@"
        static let GET_PLAYLIST             = "playlists/%@"
        static let GET_TRACK                = "tracks/%@"
        
        static let SEARCH                   = "search?q=%@"
        static let SEARCH_ALBUM             = "search/album?q=%@"
        static let SEARCH_ARTIST            = "search/artist?q=%@"
        static let SEARCH_PLAYLIST          = "search/playlist?q=%@"
        static let SEARCH_TRACK             = "search/track?q=%@"
        
        static let GET_ARTIST_TRACKS        = "artistst?id=%@&limit=%@"
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
            _ = self.manager.rx_request(method, URL, parameters: parameters, encoding: .URL)
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
                        let error = $0 as NSError
                        UIHelper.showHUD(error.localizedDescription)
                        if showProgress { UIHelper.hideSpinner() }
//                        if showProgress { UIHelper.hideProgressHUD() }
                        UIHelper.showHUD("No Internet Connection")
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
    
    //MARK: - Download -
    func downloadProgress(track: Track, progress: (Int64, Int64, Int64)->(), state: (NSError?)->()) {
        let destination = Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
        track.request = download(.GET, track.preview, destination: destination)
            .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                dispatch_async(dispatch_get_main_queue()) {
                   progress(bytesRead, totalBytesRead, totalBytesExpectedToRead)
                }
            }
            .response { request, response, _ , error in
                state(error)
            }
    }
    
    //MARK: - Autorization -
    func rx_SignIn(json: JSON) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SIGNIN,
                                          json["email"].stringValue,
                                          json["password"].stringValue)
        
        return rx_Request(.GET, url: url)
    }
    
    func rx_SignUp(json: JSON) -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + String(format: ROUTERS.SIGNUP,
                                          json["name"].stringValue,
                                          json["email"].stringValue,
                                          json["password"].stringValue,
                                          json["password_c"].stringValue)
        
        return rx_Request(.GET, url: url)
    }
    
    //MARK: - Categories -
    func rx_GetCategories() -> Observable<JSON> {
        let url = ROUTERS.ROOT_URL + ROUTERS.GET_GENRE
        return rx_Request(.GET, url: url)
    }
    
    //MARK: - Search for Name -
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
    
    //MARK: - GET for ID -
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

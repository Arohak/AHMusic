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
    
    //MARK: - API Routers -
    fileprivate struct ROUTERS {
        
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
    
    //MARK: - Request -
    func rx_Request(method: HTTPMethod,
                 url: String,
                 parameters: [String: Any]? = nil,
                 showProgress: Bool = true)
                -> Observable<JSON>
    {
        return Observable.create { observer in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            if showProgress { UIHelper.showSpinner() }
            
            let URL = ROUTERS.ROOT_URL + url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            Alamofire.request(URL, method: method,
                              parameters: parameters,
                              encoding: URLEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(JSON(data))
                    case .failure(let error):
                        UIHelper.showHUD(error.localizedDescription)
                        observer.onError(error)
                    }
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    if showProgress { UIHelper.hideSpinner() }
            }
            
            return Disposables.create { }
        }
    }
    
    //MARK: - Download -
//    func downloadProgress(_ track: Track, progress: @escaping (Int64, Int64, Int64)->(), state: @escaping (NSError?)->()) {
//        let destination = Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
//        track.request = download(.get, method: track.preview, parameters: destination)
//            .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
//                dispatch_async(dispatch_get_main_queue()) {
//                   progress(bytesRead, totalBytesRead, totalBytesExpectedToRead)
//                }
//            }
//            .response { request, response, _ , error in
//                state(error)
//            }
//    }
    
    func download(track: Track, inProgress: @escaping (Double)->(), state: @escaping (Bool)->()) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        track.request = Alamofire.download(track.preview, to: destination)
            .downloadProgress { progress in
                inProgress(progress.fractionCompleted)
            }
            .responseData { response in
                if response.result.value != nil {
                    state(true)
                }
        }
    }
    
    //MARK: - Autorization -
    func rx_SignIn(json: JSON) -> Observable<JSON> {
        let url = String(format: ROUTERS.SIGNIN, json["email"].stringValue, json["password"].stringValue)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_SignUp(json: JSON) -> Observable<JSON> {
        let url = String(format: ROUTERS.SIGNUP, json["name"].stringValue, json["email"].stringValue, json["password"].stringValue, json["password_c"].stringValue)
        return rx_Request(method: .get, url: url)
    }
    
    //MARK: - Categories -
    func rx_GetCategories() -> Observable<JSON> {
        let url = ROUTERS.GET_GENRE
        return rx_Request(method: .get, url: url)
    }
    
    //MARK: - Search for Name -
    func rx_SearchAlbum(name: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.SEARCH_ALBUM, name)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_SearchArtist(name: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.SEARCH_ARTIST, name)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_SearchpPlaylist(name: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.SEARCH_PLAYLIST, name)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_SearchpTrack(name: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.SEARCH_TRACK, name)
        return rx_Request(method: .get, url: url)
    }

    func rx_Search(name: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.SEARCH, name)
        return rx_Request(method: .get, url: url)
    }
    
    //MARK: - GET for ID -
    func rx_GetAlbum(id: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_ALBUM, id)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_GetArtist(id: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_ARTIST, id)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_GetArtistTracks(id: String, limit: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_ARTIST_TRACKS, id, limit)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_GetPlaylist(id: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_PLAYLIST, id)
        return rx_Request(method: .get, url: url)
    }
    
    func rx_GetTrack(id: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_TRACK, id)
        return rx_Request(method: .get, url: url)
    }
}

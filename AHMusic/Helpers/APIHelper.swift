//
//  APIHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//let apiHelper = APIHelper.sharedInstance
//
//class APIHelper {
//    
//    static let sharedInstance = APIHelper()
//    let manager = Manager.sharedInstance
//    
//    //MARK: - API Routers
//    private struct ROUTERS
//    {
//        static let GET_WEATHER              = "http://api.apixu.com/v1/current.json?key=6c0d9ec402854c01a6c120751160203&q=%@"
//        static let GET_WEATHER_FORECAST     = "http://api.apixu.com/v1/forecast.json?key=6c0d9ec402854c01a6c120751160203&q=%@&days=%@"
//        static let GEOCODE_ADDRESS          = "https://maps.googleapis.com/maps/api/geocode/json?address=%@"
//        static let GET_DIRECTIONS           = "https://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@"
////        static let GET_WEATHER = "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=848c6f714deb2219816b686306bc766d"
//    }
//    
//    private func rx_Request(method: Alamofire.Method,
//                            url: String,
//                            parameters: [String: AnyObject]? = nil,
//                            showProgress: Bool = true)
//                            -> Observable<JSON>
//    {
//        return Observable.create { observer in
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//            if showProgress { UIHelper.showProgressHUD() }
//            let URL = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//            
//            _ = self.manager.rx_request(method, URL, parameters: parameters, encoding: .URL)
//                .observeOn(MainScheduler.instance)
//                .flatMap {
//                    $0.rx_JSON()
//                }
//                .subscribe(
//                    onNext: {
//                        observer.onNext(JSON($0))
//                    },
//                    onError: {
//                        observer.onError($0)
//                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                        if showProgress { UIHelper.hideProgressHUD() }
//                    },
//                    onCompleted: {
//                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                        if showProgress { UIHelper.hideProgressHUD() }
//                        observer.onCompleted()
//                    })
//            
//            return AnonymousDisposable { }
//        }
//    }
//    
//    func rx_GetWeather(cityName: String) -> Observable<JSON> {
//        let url = String(format: ROUTERS.GET_WEATHER, cityName)
//        return rx_Request(.GET, url: url)
//    }
//    
//    func rx_GetWeatherForecast(cityName: String, days: String) -> Observable<JSON> {
//        let url = String(format: ROUTERS.GET_WEATHER_FORECAST, cityName, days)
//        return rx_Request(.GET, url: url)
//    }
//    
//    func rx_GeocodeAddress(cityName: String) -> Observable<JSON> {
//        let url = String(format: ROUTERS.GEOCODE_ADDRESS, cityName)
//        return rx_Request(.GET, url: url)
//    }
//    
//    func rx_GetDirections(origin: String, destination: String) -> Observable<JSON> {
//        let url = String(format: ROUTERS.GET_DIRECTIONS, origin, destination)
//        return rx_Request(.GET, url: url)
//    }
//}

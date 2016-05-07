//
//  UISettings.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//let dbHelper = DBHelper.sharedInstance
//
//class DBHelper {
//    
//    static let sharedInstance = DBHelper()
//    var realm: Realm!
//    
//    private init() {
//        realm = try! Realm()
//    }
//    
//    //MARK: - Weather
//    func getStoredWeathers() -> Results<Weather> {
//        let weathers = realm.objects(Weather.self)
//        
//        return weathers
//    }
//    
//    func storeWeather(item: Weather) {
//        try! realm.write {
//            let item1 = realm.create(Weather.self, value: item, update: true)
//            realm.add(item1)
//        }
//    }
//    
//    //MARK: - Weather Forecast
//    func getStoredWeatherForecast(city: String) -> Results<WeatherForecast> {
//        let weathers = realm.objects(WeatherForecast).filter("name == %@", city)
//        
//        return weathers
//    }
//    
//    func storeWeatherForecast(item: WeatherForecast) {
//        try! realm.write {
//            let item1 = realm.create(WeatherForecast.self, value: item, update: true)
//            realm.add(item1)
//        }
//    }
//}

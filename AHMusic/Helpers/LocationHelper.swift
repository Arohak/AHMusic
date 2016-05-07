//
//  LocationHelper.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//let locationHelper = LocationHelper.sharedInstance
//
//class LocationHelper: NSObject, CLLocationManagerDelegate {
//    
//    static let sharedInstance = LocationHelper()
//    var locationManager: CLLocationManager!
//    var locationStatus = "Not Started"
//    
//    override init() {
//        super.init()
//        
//       initLocationManager() 
//    }
//    
//    // MARK: - Private Method
//    private func initLocationManager() {
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//    }
//
//    // MARK: - CLLocationManagerDelegate
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        EventCenter.defaultCenter.post(AHWLocation(result: locations.last!))
//    }
//    
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        var shouldIAllow = false
//        
//        switch status {
//        case CLAuthorizationStatus.Restricted:
//            locationStatus = "Restricted Access to location"
//        case CLAuthorizationStatus.Denied:
//            locationStatus = "User denied access to location"
//        case CLAuthorizationStatus.NotDetermined:
//            locationStatus = "Status not determined"
//        default:
//            locationStatus = "Allowed to location Access"
//            shouldIAllow = true
//        }
//        if (shouldIAllow == true) {
//            print("Location to Allowed")
//        } else {
//            UIHelper.showHUD("Denied access: \(locationStatus)")
//        }
//    }
//}

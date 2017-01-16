//
//  ApplicationAssembly.swift
//  AHMusic
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//import Typhoon
//
//public class ApplicationAssembly: TyphoonAssembly {
//
//    //Application
//    public dynamic func appDelegate() -> AnyObject {
//        return TyphoonDefinition.withClass(AppDelegate.self) {
//            $0.injectProperty("rootPresenter", with: self.landingPresenter())
//        }
//    }
//
//    //Landing
//    public dynamic func landingPresenter() -> AnyObject {
//        return TyphoonDefinition.withClass(LandingPresenter.self) {
//            $0.injectProperty("view", with: self.landingViewController())
//            $0.injectProperty("interactor", with: self.landingInteractor())
//            $0.injectProperty("router", with: self.landingRouter())
//        }
//    }
//    
//    public dynamic func landingViewController() -> AnyObject {
//        return TyphoonDefinition.withClass(LandingViewController.self) {
//            $0.injectProperty("output", with: self.landingPresenter())
//        }
//    }
//    
//    public dynamic func landingInteractor() -> AnyObject {
//        return TyphoonDefinition.withClass(LandingInteractor.self) {
//            $0.injectProperty("output", with: self.landingPresenter())
//        }
//    }
//    
//    public dynamic func landingRouter() -> AnyObject {
//        return TyphoonDefinition.withClass(LandingRouter.self)
//    }
//}

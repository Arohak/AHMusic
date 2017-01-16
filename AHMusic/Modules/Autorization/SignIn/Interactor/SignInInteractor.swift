//
//  SignInInteractor.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignInInteractor -
class SignInInteractor {

    weak var output: SignInInteractorOutput!
}

//MARK: - extension for SignInInteractorInput -
extension SignInInteractor: SignInInteractorInput {
    
    func signin(_ json: JSON) {
        _ = apiHelper.rx_SignIn(json: json)
            .subscribe(onNext: { result in
                let status = result["data"]["status"].stringValue
                if status == "success" {
                    self.output.signinIsReady()
                } else {
                    UIHelper.showHUD(status)
                }
        })
    }
}

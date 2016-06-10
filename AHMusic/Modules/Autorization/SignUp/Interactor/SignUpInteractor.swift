//
//  SignUpInteractor.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignUpInteractor -
class SignUpInteractor {

    weak var output: SignUpInteractorOutput!
}

//MARK: - extension for SignUpInteractorInput -
extension SignUpInteractor: SignUpInteractorInput {
    
    func signup(json: JSON) {
        _ = apiHelper.rx_SignUp(json)
            .subscribeNext { result in
                let status = result["data"]["status"].stringValue
                if status == "success" {
                    self.output.signupIsReady()
                } else {
                    UIHelper.showHUD(status)
                }
        }
    }
}
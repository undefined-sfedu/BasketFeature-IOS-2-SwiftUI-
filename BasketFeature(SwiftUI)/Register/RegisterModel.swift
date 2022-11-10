//
//  RegisterModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class RegisterModel{
    private var serverHelper = UrlHelper()
    var viewModel: RegisterViewModel? = nil
    private var localUser = LocalUser()
    
    func register(email: String, password: String){
//        let url = serverHelper.getPath(typeOfrequest: .createUser)
        let url = serverHelper.getPath(typeOfrequest: .createUser, typeOfParam: .withoutParam, param: nil)
        let body = [
            "email" : email,
            "password" : password
        ]
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { [self] answer in
            
            guard let answerData = answer.data else {return}
            
            if answer.response?.statusCode == 200{
                let data = try? JSON(data: answerData)
                print(data)
                if let corData = data{
                    var res = [(LocalUser.UserKeys,String)]()
                    res.append((LocalUser.UserKeys.firstName, corData["first_name"].stringValue))
                    res.append((LocalUser.UserKeys.id, corData["id"].stringValue))
                    res.append((LocalUser.UserKeys.lastName, corData["last_name"].stringValue))
                    res.append((LocalUser.UserKeys.middleName, corData["middle_name"].stringValue))
                    res.append((LocalUser.UserKeys.email, corData["email"].stringValue))
                    res.forEach { item in
                        localUser.writeData(typeOfData: item.0, data: item.1)
                    }
                    viewModel?.userIsRegistered()
                }
                
            }
        }
    }
}

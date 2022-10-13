//
//  LoginModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 05.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
/*
 enter data for test user
 "email": "testUser",
 "password": "testUser"
 */
class LoginModel{
    private var helperServer = ServerHelper()
    private var localUser = LocalUser()
    var viewModel: LoginViewModel? = nil
    
    func enter(email: String, password: String){
        let url = helperServer.getPath(typeOfrequest: .authUser, typeOfParam: .authData, param: [email, password])
        let headers: HTTPHeaders = ["accept": "application/json"]
        //        let body = [
        //            "email" : email,
        //            "password" : password
        //        ]
        print(url)
        print(email)
        print(password)
        AF.request(url, method: .get, headers: headers).responseJSON { [self] answer in
            
            
            guard let answerData = answer.data else {return}
            
            let data = try? JSON(data: answerData)
            print(answer.response?.statusCode)
            print(data)
            
            if answer.response?.statusCode == 200{
                viewModel!.canEnter()
                
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
                }
                
                    
            }
            else if answer.response?.statusCode == 401{
                viewModel?.wrongData(error: .wrongPassword)
            }
            
            else if answer.response?.statusCode == 404{
                viewModel?.wrongData(error: .wrongEmail)
            }
            else{
                viewModel?.wrongData(error: .all)
            }
        }
        
        
        
    }
}

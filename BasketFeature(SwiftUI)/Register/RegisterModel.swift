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
    private var serverHelper = ServerHelper()
    var viewModel: RegisterViewModel? = nil
    
    func register(email: String, password: String){
//        let url = serverHelper.getPath(typeOfrequest: .createUser)
        let url = serverHelper.getPath(typeOfrequest: .createUser, typeOfParam: .withoutParam, param: nil)
        let body = [
            "email" : email,
            "password" : password
        ]
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { answer in
            print(JSON(answer.data))
            if answer.response?.statusCode == 200{
                guard let corData = answer.data else {return}
                let data = try? JSON(data: corData)
                print(data)
            }
        }
    }
}

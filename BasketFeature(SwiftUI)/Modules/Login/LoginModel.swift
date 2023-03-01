//
//  LoginModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 05.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import Moya

class LoginModel {
    
    // MARK: - Properties
    
    private let userDataManager = UserDataManager.shared
    
    // MARK: - Methods
    
    func enter(email: String, password: String, completion: @escaping (LoginViewModel.RequestStatus) -> () ) {
        RequestManager.shared.request(.logIn(email: email, password: password)) { [weak self] result in
            switch result {
            case .success(let response):
                
                if response.statusCode == 200 {
                    do {
                        let data = try JSON(data: response.data)
                        let user = User(email: data["email"].stringValue,
                                        id: data["id"].intValue,
                                        firstName: data["first_name"].stringValue,
                                        lastName: data["last_name"].stringValue,
                                        middleName: data["middle_name"].stringValue)
                        self?.userDataManager.user = user
                        completion(.canEnter)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else if response.statusCode == 401 {
                    completion(.wrongPassword)
                } else if response.response?.statusCode == 404 {
                    completion(.wrongEmail)
                } else {
                    completion(.all)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
}

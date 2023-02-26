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
    var viewModel: LoginViewModel? = nil
    
    // MARK: - Methods
    
    func enterX(email: String, password: String) {
        let provider = MoyaProvider<RequestManager>()
        provider.request(.logIn(email: email, password: password)) { [weak self] result in
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
                        self?.viewModel?.canEnter()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                else if response.statusCode == 401{
                    self?.viewModel?.wrongData(error: .wrongPassword)
                }
                
                else if response.response?.statusCode == 404{
                    self?.viewModel?.wrongData(error: .wrongEmail)
                }
                else{
                    self?.viewModel?.wrongData(error: .all)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
}

//
//  RegisterModel.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 27.09.2022.
//

import Alamofire
import SwiftyJSON

class RegisterModel {
    
    // MARK: - Properties
    
    private let userDataManager = UserDataManager.shared
    
    // MARK: - Methods
    
    func register(email: String, password: String, completion: @escaping () -> ()) {
        RequestManager.shared.request(.register(email: email, password: password)) { [weak self] result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                if response.statusCode == 200 {
                    do {
                        let corData = try JSON(data: response.data)
                        let user = User(email: corData["email"].stringValue,
                                        id: corData["id"].intValue,
                                        firstName: corData["first_name"].stringValue,
                                        lastName: corData["last_name"].stringValue,
                                        middleName: corData["middle_name"].stringValue)
                        self?.userDataManager.user = user
                        completion()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


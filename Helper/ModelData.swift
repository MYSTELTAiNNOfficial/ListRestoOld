//
//  Auth.swift
//  ListResto
//
//  Created by Macbook Pro on 29/05/22.
//  Credit: Ipung DEV Academy @ YT

import Foundation
import Combine
import SystemConfiguration

class ModelData: ObservableObject {
    
    var stateChange = PassthroughSubject<ModelData, Never>()
    
    @Published var userData: UserData = UserData.default
    var response: RespRece = RespRece.default
    @Published var correct: Bool = true
    @Published var received: Bool = false
    @Published var loggedIn: Bool = false {
        didSet {
            stateChange.send(self)
        }
    }
    
    func checkLogin(email: String, password: String){
        guard let url = URL(string: "http://10.0.49.214/login.php") else { return }
        
        let bodyReq : [String : String] = ["email" : email, "password" : password]
        
        guard let finaldata = try? JSONEncoder().encode(bodyReq) else {return}
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finaldata
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            let result = try? JSONDecoder().decode(UserData.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    if(!result.err){
                        self.loggedIn = true
                        self.userData.id = result.id
                        self.userData.user = result.user
                        self.userData.err = result.err
                        self.userData.message = result.message
                    }else{
                        self.correct = false
                        self.userData.message = result.message
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.correct = false
                }
            }
        }.resume()
    }
    
    func register(nama: String, email: String, password: String){
        guard let url = URL(string: "http://10.0.49.214/register.php") else { return }
        
        let bodyReq : [String : String] = ["nama" : nama, "email" : email, "password" : password]
        
        guard let finaldata = try? JSONEncoder().encode(bodyReq) else {return}
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finaldata
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, response == response, error == nil else {return}
            
            let result = try? JSONDecoder().decode(RespRece.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    if(!result.err){
                        self.correct = true
                        self.received = true
                        self.userData.message = result.message
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.correct = false
                }
            }
        }.resume()
    }
}

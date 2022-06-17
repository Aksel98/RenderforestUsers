//
//  GetUsersCommand.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import Foundation

class GetUsersCommand: CommonCommand {
    
    func execute() {
        guard let url = URL(string: "https://randomuser.me/api?seed=renderforest&results=20&page=1") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode(Results.self, from: data)
                print(users)
                
//                let data = try JSONSerialization.jsonObject(with: data, options: [])
//                print(data)
            } catch {
                print(error)
            }
        }).resume()
    }
}

struct Results: Decodable {
    var results: [User]
}

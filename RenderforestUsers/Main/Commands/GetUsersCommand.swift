//
//  GetUsersCommand.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import Foundation

struct GetUsersCommand: CommonCommand {
    
    private let successHandler: (([User]) -> Void)
    
    init(successHandler: @escaping (([User]) -> Void)) {
        self.successHandler = successHandler
    }
    
    func execute() {
        guard let url = URL(string: "https://randomuser.me/api?seed=renderforest&results=20&page=1") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }

            do {
                let data = try JSONDecoder().decode(Result.self, from: data)
                
                DispatchQueue.main.async {
                    self.successHandler(data.results)
                }
            } catch {
                print(error)
            }
        }).resume()
    }
}

struct Result: Decodable {
    var results: [User]
}

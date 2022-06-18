//
//  GetUsersCommand.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 17.06.22.
//

import Foundation

struct GetUsersCommand: CommonCommand {
    
    private let successHandler: (([User]) -> Void)
    private let errorHandler: ((String) -> Void)?
    private let page: Int
    
    init(successHandler: @escaping (([User]) -> Void), errorHandler: ((String) -> Void)? = nil, page: Int) {
        self.successHandler = successHandler
        self.errorHandler = errorHandler
        self.page = page
    }
    
    func execute() {
        guard let url = URL(string: "https://randomuser.me/api?seed=renderforest&results=20&page=\(page)") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    errorHandler?(error?.localizedDescription ?? "")
                }
                return
            }

            do {
                let data = try JSONDecoder().decode(Result.self, from: data)
                
                DispatchQueue.main.async {
                    self.successHandler(data.results)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorHandler?(error.localizedDescription)
                }
            }
        }).resume()
    }
}


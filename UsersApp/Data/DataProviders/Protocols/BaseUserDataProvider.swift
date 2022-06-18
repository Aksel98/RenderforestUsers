//
//  BaseUserDataProvider.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import Foundation

protocol BaseUserDataProvider {
    func getCurrentData(search: String) -> [User]
}

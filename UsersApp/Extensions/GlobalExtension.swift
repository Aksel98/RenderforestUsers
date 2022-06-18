//
//  GlobalExtension.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

func getKeyWindow() -> UIWindow? {
    return getScene()?.windows.first { $0.isKeyWindow }
}

func getScene() -> UIWindowScene? {
    return UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first
}

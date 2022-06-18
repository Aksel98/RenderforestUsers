//
//  ToastViewConfig.swift
//  RenderforestUsers
//
//  Created by Aksel Avetisyan on 18.06.22.
//

import UIKit

struct ToastViewConfig {
    let view: UIView
    let frame: CGRect
    var backgroundColor: UIColor = .baseColors.getBlack()
    var cornerRadius: CGFloat = 10
    var alfa: CGFloat = 0.85
    var width: CGFloat? = nil
    var height: CGFloat = 75
    var yPositionDistance: CGFloat = 40
    var animateDuration: Double = 0.6
    var autoCloseTime: Double = 7
    var openFromTop: Bool = true
}

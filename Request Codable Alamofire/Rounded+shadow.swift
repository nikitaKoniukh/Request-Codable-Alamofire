//
//  Rounded+shadow.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 30/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import UIKit

@IBDesignable
class Rounded_shadow: UIView {

    let shadowLayer = CAShapeLayer()

    override func layoutSubviews() {
        self.addShadow(shadowColor: .lightGray, offSet: CGSize(width: 0.0, height: 5), opacity: 0.3, shadowRadius: 5.0, cornerRadius: 20.0, corners: [.topLeft, .bottomLeft], fillColor: .white)

    }

    private func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner, fillColor: UIColor = .white) {
        self.layer.masksToBounds = false

        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath
        shadowLayer.path = cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
}



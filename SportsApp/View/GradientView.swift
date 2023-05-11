//
//  GradientView.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 09/05/2023.
//

import Foundation
import UIKit

@IBDesignable

class GradientView : UIView{
    
    @IBInspectable var topColor : UIColor = UIColor(named: "myDarkBlue") ?? UIColor.black
    @IBInspectable var bottomColor : UIColor = UIColor(named: "myOrange") ?? UIColor.gray
    
    var startPointX :CGFloat = 0
    var startPointY :CGFloat = 0
    var endPointX :CGFloat = 1
    var endPointY :CGFloat = 1
    
    
    override func layoutSubviews(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    
}

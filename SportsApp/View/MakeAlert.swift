//
//  MakeAlert.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
import UIKit

class MakeAlert{
    
    
    static func displayAlert(title : String , message: String , action : UIAlertAction , controller :UIViewController){
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        controller.present(alert, animated: true,completion: nil)
    }
    
}

//
//  SplashController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 01/05/2023.
//

import UIKit
import Lottie

class SplashController: UIViewController {

    
    override func viewDidLoad() {
        
        let animationView = LottieAnimationView(name : "sports-app-loading-indicator")
        let containerView = UIView()

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // adding lottie to my view
        containerView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        animationView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),containerView.widthAnchor.constraint(equalToConstant: 200),containerView.heightAnchor.constraint(equalToConstant: 200),animationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),animationView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),animationView.widthAnchor.constraint(equalTo: containerView.widthAnchor),animationView.heightAnchor.constraint(equalTo: containerView.heightAnchor)])
        
        animationView.play()
        
        // wait 2 seconds and go to the next screen
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3 ){
            self.performSegue(withIdentifier: "OpenMenu", sender: nil)
        }
    }

}

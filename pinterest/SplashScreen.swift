//
//  SplashScreen.swift
//  pinterest
//
//  Created by Alumno IDS on 3/14/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit


class SplashScreen: UIViewController {
    
    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self as? SwiftyGifDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
    }
    
}

extension SplashScreen: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        print("do it")
        let login = LoginViewController()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.setRootViewController(login)
    }
}

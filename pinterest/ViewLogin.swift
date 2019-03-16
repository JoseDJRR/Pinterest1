//
//  ViewLogin.swift
//  pinterest
//
//  Created by Alumno IDS on 3/7/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase
import SwiftyGif

class ViewLogin: UIViewController {
    private var grad: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(background)
        logoContainerView.addSubview(logo)
        logoContainerView.addSubview(tittle)
        view.addSubview(buttonsContainerView)
        buttonsContainerView.addSubview(emailButton)
        buttonsContainerView.addSubview(fbButton)
        buttonsContainerView.addSubview(googleButton)
        buttonsContainerView.addSubview(loginButton)
        buttonsContainerView.addSubview(terms)
        
        logoContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logoContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        logoContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        background.leftAnchor.constraint(equalTo: logoContainerView.leftAnchor).isActive = true
        background.rightAnchor.constraint(equalTo: logoContainerView.rightAnchor).isActive = true
        background.heightAnchor.constraint(equalTo: logoContainerView.widthAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor, constant: -30).isActive = true
        
        grad = CAGradientLayer()
        grad.frame = background.bounds
        grad.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        grad.locations = [0, 0, 0.4, 1]
        background.layer.mask = grad
        
        logo.leftAnchor.constraint(equalTo: logoContainerView.leftAnchor, constant: 100).isActive = true
        logo.rightAnchor.constraint(equalTo: logoContainerView.rightAnchor, constant: -100).isActive = true
        logo.heightAnchor.constraint(equalTo: logo.widthAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor).isActive = true
       
        tittle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
        tittle.widthAnchor.constraint(equalTo: logoContainerView.widthAnchor).isActive = true
         
        buttonsContainerView.topAnchor.constraint(equalTo: logoContainerView.bottomAnchor, constant: -15 ).isActive = true
        buttonsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        buttonsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        emailButton.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor, constant: 10).isActive = true
        emailButton.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        emailButton.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 1/7).isActive = true
        
        fbButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 7).isActive = true
        fbButton.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        fbButton.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 1/7).isActive = true
        
        googleButton.topAnchor.constraint(equalTo: fbButton.bottomAnchor, constant: 7).isActive = true
        googleButton.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        googleButton.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 1/7).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 35).isActive = true
        loginButton.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: buttonsContainerView.heightAnchor, multiplier: 1/7).isActive = true      
        
        terms.topAnchor.constraint(equalTo: buttonsContainerView.bottomAnchor, constant: -80).isActive = true
        terms.widthAnchor.constraint(equalTo: buttonsContainerView.widthAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        grad.frame = background.bounds
    }
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Correo Electrónico"
        tf.backgroundColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Contraseña"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        return tf
    }()

        let logoContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nombre"
        tf.backgroundColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    let buttonsContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let emailButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(r: 201, g: 34, b: 40)
        ub.setTitle("Continuar con el correo electrónico", for: .normal)
        ub.titleLabel?.font =  UIFont(name: "KohinoorBangla-Regular", size: 18)
        ub.layer.cornerRadius = 20
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButtonEmail), for: .touchUpInside)
        return ub
    }()
    
    let fbButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(r: 60, g: 88, b: 153)
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.titleLabel?.font =  UIFont(name: "KohinoorBangla-Regular", size: 18)
        ub.layer.cornerRadius = 20
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    let googleButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(r: 66, g: 113, b: 246)
        ub.setTitle("Continuar con Google", for: .normal)
        ub.titleLabel?.font =  UIFont(name: "KohinoorBangla-Regular", size: 18)
        ub.layer.cornerRadius = 20
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    let loginButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(r: 240, g: 238, b: 241)
        ub.setTitle("Iniciar Sesión", for: .normal)
        //ub.titleLabel?.font =  UIFont(name: "KohinoorBangla-Regular", size: 18)
        ub.setTitleColor(.black, for: .normal)
        ub.layer.cornerRadius = 20
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButtonSignIn), for: .touchUpInside)
        return ub
    }()
    
    let logo : UIImageView = {
        let imageName = "pinterest"
        let image = UIImage(named: imageName)
        let iv = UIImageView(image: image!)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

        let tittle : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.text = "Te damos la bienvenida a\nPinterest"
        lb.font =  UIFont(name: "KohinoorBangla-Regular", size: 28)
        lb.numberOfLines = 2;
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let background : UIImageView = {
        let imageName = "background"
        let image = UIImage(named: imageName)
        let iv = UIImageView(image: image!)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let terms : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.text = "Si continúas, aceptas las Condiciones del servicio y la Política\nde Privacidad de Pinterest"
        lb.numberOfLines = 2;
        lb.font =  UIFont(name: "GillSans", size: 15.5)
        lb.font = lb.font.withSize(13.3)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    @objc func handleButton(){
        print("Hola mundo")
        if let email = emailTextField.text, let pass = passwordTextField.text, let name = nameTextField.text{
            print(email)
            print(pass)
            Auth.auth().createUser(withEmail: email, password: pass) { (data:AuthDataResult?, error) in
                let user = data?.user
                if error != nil {
                    print(error.debugDescription)
                }
                
                //succesful
                let ref = Database.database().reference(fromURL: "https://pinterest-mrdl98.firebaseio.com")
                
                if let uid = user?.uid{
                    
                    let usersRef = ref.child("users").child(uid)
                    usersRef.updateChildValues(["name" : name, "email" : email, "password": pass])
                    
                    let msgsRef = ref.child("message").child(uid)
                    msgsRef.updateChildValues(["message" : "Prueba"])
                    
                    ref.child("message").child(uid).removeValue()
                    
                }
            }
        }
    }
    
    @objc func handleButtonEmail(){
        print("Email")
        let email = EmailViewController()        
        email.register = .email
        self.navigationController?.pushViewController(email, animated: true)        
    }
    
    @objc func handleButtonSignIn(){
        print("Sign In")
        let signin = ViewController()
        //email.register = .email
        self.navigationController?.pushViewController(signin, animated: true)
    }
    
}

extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
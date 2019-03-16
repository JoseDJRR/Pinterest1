//
//  ViewEmail.swift
//  pinterest
//
//  Created by Alumno IDS on 3/14/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase
import SwiftyGif

class ViewEmail: UIViewController {
    
    enum Register {
        case email
        case password
        case age
    }
    
    var register : Register?
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Titulo
        self.navigationItem.title = "Regístrate"
        
        //Titulo backbtn
        let backBtn = UIBarButtonItem()
        backBtn.title = "Atras"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBtn

        view.backgroundColor = .white
        
        inputContainerView.addSubview(label1)
        view.addSubview(inputContainerView)
        view.addSubview(firstButton)
        inputContainerView.addSubview(emailTextField)
        
        label1.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 100).isActive = true
        label1.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true

        inputContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -25).isActive = true
        
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        firstButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        firstButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        firstButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/14).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: label1.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
    }
    
    lazy var label1 : UILabel = {
        let lb = UILabel()
        if let registerVal = register {
            switch registerVal {
            case .email:
                lb.text = "Cuál es tu correo electrónico...."
            case .password:
                lb.text = "Escribe tu contraseña...."
            case .age:
                lb.text = "Cuál es tu edad...."
            }}
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    let inputContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()

    lazy var emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        if let registerVal = register {
            switch registerVal {
            case .email:
                tf.placeholder = "Correo.."
            case .password:
                tf.placeholder = "Contraseña.."
                tf.isSecureTextEntry = true
            case .age:
                tf.placeholder = "Edad.."
            }}
        tf.font =  UIFont(name: "KohinoorBangla-Regular", size: 30)
        tf.backgroundColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(r: 201, g: 34, b: 40)
        if let registerVal = register {
            switch registerVal {
            case .email:
                ub.setTitle("Siguiente", for: .normal)
            case .password:
                ub.setTitle("Siguiente", for: .normal)
            case .age:
                ub.setTitle("Registrarse", for: .normal)
            }}
        ub.titleLabel?.font =  UIFont(name: "KohinoorBangla-Regular", size: 15)
        ub.layer.cornerRadius = 20
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton(){
        print("Hola mundo")

        if let registerVal = register {
            switch registerVal {
            case .email:
                let user = User()
                user.email = emailTextField.text
                let email = EmailViewController()
                email.register = .password
                email.user = user
                self.navigationController?.pushViewController(email, animated: true)
            case .password:
                let email = EmailViewController()
                if let userInstance = user {
                    userInstance.password = emailTextField.text
                    email.user = userInstance
                }
                email.register = .age
                self.navigationController?.pushViewController(email, animated: true)
            case .age:
                if let userInstance = user {
                    userInstance.age = emailTextField.text
                    if let email = userInstance.email, let pass = userInstance.password, let age = userInstance.age{
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
                                usersRef.updateChildValues(["email" : email, "password": pass, "age" : age])
                                
                                //Aqui se crea
                                let msgsRef = ref.child("message").child(uid)
                                msgsRef.updateChildValues(["message" : "test"])
                                
                                //Aqui se borra el child uid de message, el de "test"
                                ref.child("message").child(uid).removeValue()
                                
                            }
                        }
                    }
                }
            }}
    }
}
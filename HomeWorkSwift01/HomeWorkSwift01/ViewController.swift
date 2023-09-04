//
//  ViewController.swift
//  HomeWorkSwift01
//
//  Created by Fedot on 8/14/23.
//  Copyright © 2023 Fedot. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebVew(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
      /*
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
        
    }()
    
    private var labelView: UILabel = {
        let label = UILabel()
        label.text = "Autorization"
        label.textAlignment = .center
        return label
    }()
    
    private var textFldLoginView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Логин"
        return textField
    }()
    
    private var textFldPasswordView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        return textField
    }()
    
    private var buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=" + AppCode.appCode +
            "&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
    }
 

    private func setupViews() {
        view.addSubview(webView)

    }
    
    private func tap(){
        
        let tab1 = UINavigationController(rootViewController: FriendViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
    }

/*
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelView.translatesAutoresizingMaskIntoConstraints = false
        textFldLoginView.translatesAutoresizingMaskIntoConstraints = false
        textFldPasswordView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            labelView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4),

                
            textFldLoginView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
            textFldLoginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFldLoginView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 5),

            textFldPasswordView.topAnchor.constraint(equalTo: textFldLoginView.bottomAnchor, constant: 20),
            textFldPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFldPasswordView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 5),

            buttonView.topAnchor.constraint(equalTo: textFldPasswordView.topAnchor, constant: 30),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            ])
        }
    }
*/
extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()){ result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}

//
//  ThemeView.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

import UIKit

protocol ThemeViewDelegate: AnyObject {
    func updateColor()
}

final class ThemeView: UIView {
    weak var delegate: ThemeViewDelegate?
    
    private var themeTitle: UILabel = {
        let label = UILabel()
        label.text = "Choose theme:"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var themeWhiteButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        //button.setTitle("Select Theme", for: .normal)
        //button.setTitleColor(.white, for: .normal)
        //button.setTitleColor(.green, for: .highlighted)
        button.backgroundColor = WhiteTheme().backgroundColor
        return button
    }()
    
    private var themeBlueButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlueTheme().backgroundColor
        return button
    }()
    
    private var themeGreenButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = GreenTheme().backgroundColor
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.currentTheme.backgroundColor
        themeWhiteButton.addTarget(self, action: #selector(tapWhiteTheme), for: .touchUpInside)
        themeBlueButton.addTarget(self, action: #selector(tapBlueTheme), for: .touchUpInside)
        themeGreenButton.addTarget(self, action: #selector(tapGreenTheme), for: .touchUpInside)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(themeTitle)
        addSubview(themeWhiteButton)
        addSubview(themeBlueButton)
        addSubview(themeGreenButton)
        setupConstraints()
    }
    
    private func setupConstraints(){
        themeTitle.translatesAutoresizingMaskIntoConstraints = false
        themeWhiteButton.translatesAutoresizingMaskIntoConstraints = false
        themeBlueButton.translatesAutoresizingMaskIntoConstraints = false
        themeGreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            themeTitle.topAnchor.constraint(equalTo: self.topAnchor),
            themeTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            themeTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            themeBlueButton.topAnchor.constraint(equalTo: themeTitle.bottomAnchor, constant: 70),
            themeWhiteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeWhiteButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            themeWhiteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            themeBlueButton.topAnchor.constraint(equalTo: themeWhiteButton.bottomAnchor, constant: 20),
            themeBlueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeBlueButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            themeBlueButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            themeGreenButton.topAnchor.constraint(equalTo: themeBlueButton.bottomAnchor, constant: 20),
            themeGreenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeGreenButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            themeGreenButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
private extension ThemeView {
    @objc func tapWhiteTheme() {
        Theme.currentTheme  = WhiteTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
    }
    @objc func tapBlueTheme() {
        Theme.currentTheme  = BlueTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
    }
    @objc func tapGreenTheme() {
        Theme.currentTheme  = GreenTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
        ThemeSaver.putData()
    }
}


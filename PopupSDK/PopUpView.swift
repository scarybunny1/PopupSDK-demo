//
//  PopUpView.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import UIKit

protocol PopUpViewDelegate: AnyObject{
    func didTapOkButton()
}

class PopUpView: UIView{
    
    //MARK:  UI Components
    let titleLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = .secondarySystemBackground
        l.textColor = .label
        l.text = "Title"
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 20, weight: .bold)
        return l
    }()
    
    let messageLabel: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.text = "Some message..."
        l.font = .systemFont(ofSize: 16)
        l.numberOfLines = 0
        return l
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let okButton: UIButton = {
        let b = UIButton()
        b.setTitle("Okay", for: .normal)
        b.backgroundColor = .secondarySystemBackground
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    //MARK:  Class Properties
    weak var delegate: PopUpViewDelegate?
    
    //MARK:  Class Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        backgroundColor = .systemBackground
        
        clipsToBounds = true
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(imageView)
        addSubview(okButton)
        
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        imageView.image = UIImage(systemName: "pencil")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK:  Lifecycle methods
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            
            okButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            okButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            okButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bottomAnchor.constraint(equalTo: okButton.bottomAnchor)
        ])
    }
    
    //MARK:  Class Helper methods
    func configure(title: String, message: String){
        titleLabel.text = title
        messageLabel.text = message
    }
    
    @objc private func okButtonTapped(){
        delegate?.didTapOkButton()
    }
}

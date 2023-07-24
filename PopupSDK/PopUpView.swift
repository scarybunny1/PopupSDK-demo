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
    
    let helpMessage: UIButton = {
        let b = UIButton()
        b.setTitle("Tap here to get cute Cat pics", for: .normal)
        b.setTitleColor(.red, for: .normal)
        return b
    }()
    
    let okButton: UIButton = {
        let b = UIButton()
        b.setTitle("Okay", for: .normal)
        b.backgroundColor = .secondarySystemBackground
        b.setTitleColor(.blue, for: .normal)
        return b
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
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
        addSubview(helpMessage)
        addSubview(activityIndicator)
        
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getRandomCatImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        helpMessage.addTarget(self, action: #selector(getRandomCatImage), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK:  Lifecycle methods
    override func layoutSubviews() {
        super.layoutSubviews()
        helpMessage.frame = imageView.bounds
        helpMessage.center = imageView.center
        activityIndicator.center = imageView.center
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
    
    @objc private func getRandomCatImage(){
        helpMessage.isHidden = true
        activityIndicator.startAnimating()
        
        APIService.shared.dataTask(CatRequest.getRandomCat) { [weak self] result in
            var resultantImage: UIImage
            switch result {
            case .success(let imageData):
                if let image = UIImage(data: imageData){
                    resultantImage = image
                } else{
                    resultantImage = UIImage(systemName: "person")!
                }
            case .failure(let error):
                print(error)
                resultantImage = UIImage(systemName: "person")!
            }
            
            self?.updateImageView(with: resultantImage)
        }
    }
    
    private func updateImageView(with image: UIImage){
        DispatchQueue.main.async {
            self.imageView.image = image
            self.activityIndicator.stopAnimating()
        }
    }
}

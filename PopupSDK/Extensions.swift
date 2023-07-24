//
//  Extensions.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import UIKit

extension UIViewController{
    public func showPopUp(alignment: PopUpAlignment){
        let vc = PopUpViewController(popUpAlignment: alignment)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}

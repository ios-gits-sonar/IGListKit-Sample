//
//  UIImageView+Ext.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 22/10/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import SDWebImage
import Photos

public extension UIImageView {
    func setImageWith(url: String?, onSuccess: ((_ isSuccess: Bool)->())? = nil) {
        self.clipsToBounds = true
        guard let url = URL(string: url ?? "") else {
            self.image = nil
            self.backgroundColor = .lightGray
            onSuccess?(false)
            return
        }
        self.setLoad(isLoad: true, style: .white)
        self.sd_setImage(with: url) { (img, err, cache, urls) in
            self.setLoad(isLoad: false, style: .white)
            if err == nil {
                onSuccess?(true)
                self.image = img
                self.backgroundColor = .clear
            } else {
                onSuccess?(false)
                self.image = nil
                self.backgroundColor = .lightGray
            }
        }
    }
    
    //Start or Stop a loading view in an ImageView
    func setLoad(isLoad: Bool, style: UIActivityIndicatorView.Style) {
        if isLoad {
            self.subviews.forEach{ $0.removeFromSuperview() }
            let progress = UIActivityIndicatorView(style: style)
            progress.startAnimating()
            progress.color = UIColor.white
            self.insertSubview(progress, aboveSubview: self)
            progress.autoCenterInSuperview()
        } else {
            self.subviews.forEach{ $0.removeFromSuperview() }
        }
    }
    
    func setRoundImageView(cornerRadius: CGFloat, shadow: CGFloat = 1) {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: shadow)
        layer.shadowOpacity = shadow == 0 ? 0 : 0.4
        layer.shadowRadius = shadow == 0 ? 0 : 2
        layer.shadowPath = shadowPath.cgPath
    }
    
    func g_loadImage(_ asset: PHAsset) {
        if tag == 0 {
            image = nil
        } else {
            PHImageManager.default().cancelImageRequest(PHImageRequestID(tag))
        }
        
        let options = PHImageRequestOptions()
        
        let id = PHImageManager.default().requestImage(for: asset, targetSize: frame.size,
                                                       contentMode: .aspectFill, options: options)
        { [weak self] image, _ in
            
            self?.image = image
        }
        tag = Int(id)
    }
}

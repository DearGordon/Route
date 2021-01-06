//
//  UIImageExtension.swift
//  Route
//
//  Created by Nick on 1/7/21.
//

import UIKit

extension UIImage {
    
    static func image(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 29.0, height: 29.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

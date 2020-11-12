//
//  String+Extension.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 18/09/20.
//  Copyright © 2020 Ajie Arganata. All rights reserved.
//

import UIKit

public extension String {
    
    /** Estimate height of a string.
        https://stackoverflow.com/questions/30450434/figure-out-size-of-uilabel-based-on-string-in-swift
     */
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    /** Estimate width of a string.
       https://stackoverflow.com/questions/30450434/figure-out-size-of-uilabel-based-on-string-in-swift
    */
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

public struct TextSize {
  private struct CacheEntry: Hashable, Equatable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let insets: UIEdgeInsets
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(text)
      hasher.combine(width)
      hasher.combine(insets.top)
      hasher.combine(insets.left)
      hasher.combine(insets.bottom)
      hasher.combine(insets.right)
    }
    
    static func ==(lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
      return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
    }
  }
  
  private static var cache: [CacheEntry: CGRect] = [:] {
    didSet {
      assert(Thread.isMainThread)
    }
  }
  
  public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = .zero) -> CGRect {
//    let size = text.size(withAttributes: [
//        NSAttributedString.Key.font: font
//    ])
//    return size
    let key = CacheEntry(text: text, font: font, width: width, insets: insets)
    if let hit = cache[key] {
      return hit
    }

    let constrainedSize = CGSize(width: width - insets.left - insets.right, height: .greatestFiniteMagnitude)
    let attributes = [NSAttributedString.Key.font: font]
    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
    var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
    bounds.size.width = width
    bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
    cache[key] = bounds
    return bounds
  }
}

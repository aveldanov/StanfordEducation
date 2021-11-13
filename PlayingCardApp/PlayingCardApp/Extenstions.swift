//
//  Extenstions.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/13/21.
//

import UIKit


extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    var rightHalf: CGRect {
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}

extension PlayingCardView {
    public struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    public var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    
    public var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    
    public var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
    public var rankString: String {
        switch rank {
        case 1:
            return "A"
        case 2...10:
            return String(rank)
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "?"
        }
    }
}

//
//extension UILabel{
//    
////    private var cornerString: NSAttributedString{
////        return centerAttributedString(rankString + "\n" + suit,  cornerFontSize)
////    }
//    
//    
//    public func centerAttributedString(_ string: String, _ fontSize:CGFloat){
//        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
//        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
//
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        
//        let attributedTextLabel = NSMutableAttributedString(string: string, attributes: [.font: font, .paragraphStyle: paragraphStyle])
//        attributedText = attributedTextLabel
//    } 
//}

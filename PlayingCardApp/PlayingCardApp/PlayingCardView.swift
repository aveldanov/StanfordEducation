//
//  PlayingCardView.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/12/21.
//

import UIKit

class PlayingCardView: UIView {
    
    private lazy var upperLeftCorenerLabel: UILabel = createCorenerLabel()
    private lazy var lowerRightCorenerLabel: UILabel = createCorenerLabel()
    private func createCorenerLabel() -> UILabel{
        let label = UILabel()
        label.numberOfLines = 0 //->as many lines as you need
        addSubview(label)
        return label
    }
    
    var rank: Int = 5{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    var suit: String = "❤️"{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    var isFaceUp: Bool = true{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    
    
    
    
    
    private func centerAttributedString(_ string: String, _ fontSize:CGFloat) -> NSAttributedString{
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        // scale font based on slider in iPhone settings:
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString:NSAttributedString{
        return centerAttributedString(rankString + "\n" + suit,  cornerFontSize)
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }
    
    

    
}


/*
 basics of drawing a circle
 //       if let context = UIGraphicsGetCurrentContext(){
 //            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
 //            context.setLineWidth(5.0)
 //            UIColor.green.setFill()
 //            UIColor.red.setStroke()
 //            context.strokePath()
 //            context.fillPath()
 //        }
         
 //
 //        let path = UIBezierPath()
 //        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
 //        path.lineWidth = 5.0
 //        UIColor.green.setFill()
 //        UIColor.red.setStroke()
 //        path.stroke()
 //        path.fill()
         
 
 
 */

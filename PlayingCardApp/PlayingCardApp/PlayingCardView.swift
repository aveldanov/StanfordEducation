//
//  PlayingCardView.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/12/21.
//

import UIKit

class PlayingCardView: UIView {
    
    private func centerAttributedString(_ string: String, _ fontSize:CGFloat) -> AttributedString{
        var font = UIFont.preferredFont(forTextStyle: .body)
        
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
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

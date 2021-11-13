//
//  PlayingCardView.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/12/21.
//

import UIKit

class PlayingCardView: UIView {

    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext(){
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        }
    }

}

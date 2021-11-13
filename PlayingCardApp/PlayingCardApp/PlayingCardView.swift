//
//  PlayingCardView.swift
//  PlayingCardApp
//
//  Created by Anton Veldanov on 11/12/21.
//

import UIKit
@IBDesignable

class PlayingCardView: UIView {
    
    private lazy var upperLeftCorenerLabel: UILabel = createCorenerLabel()
    private lazy var lowerRightCorenerLabel: UILabel = createCorenerLabel()
    private func createCorenerLabel() -> UILabel{
        let label = UILabel()
        label.numberOfLines = 0 //->as many lines as you need
        addSubview(label)
        return label
    }
    // add in front of  var   @IBInspectable to see and insepct all vars in main view

    @IBInspectable
    var rank: Int = 11{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    @IBInspectable

    var suit: String = "❤️"{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    @IBInspectable

    var isFaceUp: Bool = true{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    //MARK: Helpers
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCornerLabel(upperLeftCorenerLabel)
        upperLeftCorenerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
        
        configureCornerLabel(lowerRightCorenerLabel)
        // rotate the card upside fown
        lowerRightCorenerLabel.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi)
        
        lowerRightCorenerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY)
            .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
            .offsetBy(dx: -lowerRightCorenerLabel.frame.size.width, dy: -lowerRightCorenerLabel.frame.size.height)
        
    }
    
    private func configureCornerLabel(_ label: UILabel){
        //        label.centerAttributedString(rankString + "\n" + suit, cornerFontSize)
        label.attributedText = cornerString
        
        label.frame.size = CGSize.zero //reset the size so we can use sizeToFit()
        label.sizeToFit()
        label.isHidden = !isFaceUp
    }
    
    // track font size change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    
    
    private func centeredAttributedString(_ string: String, _ fontSize:CGFloat) -> NSAttributedString{
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        // scale font based on slider in iPhone settings:
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString: NSAttributedString{
        return centeredAttributedString(rankString + "\n" + suit,  cornerFontSize)
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        if isFaceUp{
            if let faceCardImage = UIImage(named: rankString+suit, in: Bundle(for: self.classForCoder), compatibleWith: traitCollection){
                faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))
            }else{
                drawPips()
            }
        }else{
            if let cardBackImage = UIImage(named: "cardback"){
                cardBackImage.draw(in: bounds)
            }
        }
    }
    
    
    
    ///
    /// Draw pips based on rank and suit
    ///
    private func drawPips()
    {
        let pipsPerRowForRank = [[0], [1], [1,1], [1,1,1], [2,2], [2,1,2], [2,2,2], [2,1,2,2], [2,2,2,2], [2,2,1,2,2], [2,2,2,2,2]]
        
        func createPipString(thatFits pipRect: CGRect) -> NSAttributedString {
            let maxVerticalPipCount = CGFloat(pipsPerRowForRank.reduce(0) { max($1.count, $0)})
            let maxHorizontalPipCount = CGFloat(pipsPerRowForRank.reduce(0) { max($1.max() ?? 0, $0)})
            let verticalPipRowSpacing = pipRect.size.height / maxVerticalPipCount
            let attemptedPipString = centeredAttributedString(suit, verticalPipRowSpacing)
            let probablyOkayPipStringFontSize = verticalPipRowSpacing / (attemptedPipString.size().height / verticalPipRowSpacing)
            let probablyOkayPipString = centeredAttributedString(suit,  probablyOkayPipStringFontSize)
            if probablyOkayPipString.size().width > pipRect.size.width / maxHorizontalPipCount {
                return centeredAttributedString(suit, probablyOkayPipStringFontSize /
                                                (probablyOkayPipString.size().width / (pipRect.size.width / maxHorizontalPipCount)))
            } else {
                return probablyOkayPipString
            }
        }
        
        if pipsPerRowForRank.indices.contains(rank) {
            let pipsPerRow = pipsPerRowForRank[rank]
            var pipRect = bounds.insetBy(dx: cornerOffset, dy: cornerOffset).insetBy(dx: cornerString.size().width, dy: cornerString.size().height / 2)
            let pipString = createPipString(thatFits: pipRect)
            let pipRowSpacing = pipRect.size.height / CGFloat(pipsPerRow.count)
            pipRect.size.height = pipString.size().height
            pipRect.origin.y += (pipRowSpacing - pipRect.size.height) / 2
            for pipCount in pipsPerRow {
                switch pipCount {
                case 1:
                    pipString.draw(in: pipRect)
                case 2:
                    pipString.draw(in: pipRect.leftHalf)
                    pipString.draw(in: pipRect.rightHalf)
                default:
                    break
                }
                pipRect.origin.y += pipRowSpacing
            }
        }
    }
    
    
    
}

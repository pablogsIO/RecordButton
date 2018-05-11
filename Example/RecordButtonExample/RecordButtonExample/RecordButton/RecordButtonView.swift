//
//  RecordButtonView.swift
//  RecordButtonExample
//
//  Created by Pablo on 10/05/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

protocol RecordButtonDelegate: class {

    func tapButton(isRecording: Bool)
}

@IBDesignable open class RecordButtonView: UIView {

    var isRecording = false
    var roundView: UIView?
    var delegate: RecordButtonDelegate?
    var squareSide: CGFloat?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRecordButtonView()

    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupRecordButtonView()
    }

    private func setupRecordButtonView() {

        self.backgroundColor = UIColor.clear

        drawExternalCircle()
        drawRoundedButton()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedView(_:))))

    }
    private func drawExternalCircle() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width/2,
                                                     y: self.bounds.size.height/2),
                                  radius: self.frame.size.height/2-2.5,
                                  startAngle: 0,
                                  endAngle: 2*CGFloat(Float.pi),
                                  clockwise: true).cgPath
        layer.lineWidth = 5
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.white.cgColor
        layer.opacity = 1

        self.layer.addSublayer(layer)
    }

    private func drawRoundedButton() {
        squareSide = 3*self.frame.size.height/4

        roundView = UIView(frame: CGRect(x: self.frame.size.width/2-squareSide!/2,
                                         y: self.frame.size.height/2-squareSide!/2,
                                         width: squareSide!,
                                         height: squareSide!))
        roundView?.backgroundColor = UIColor.red
        roundView?.layer.cornerRadius = squareSide!/2

        self.addSubview(roundView!)
    }
    private func recordToStopAnimation() -> CAAnimationGroup {

        let transformToStopButton = CABasicAnimation(keyPath: "cornerRadius")

        transformToStopButton.fromValue = !isRecording ? squareSide!/2: 10
        transformToStopButton.toValue = !isRecording ? 10:squareSide!/2

        let toSmallCircle = CABasicAnimation(keyPath: "transform.scale")

        toSmallCircle.fromValue = !isRecording ? 1: 0.65
        toSmallCircle.toValue = !isRecording ? 0.65: 1

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformToStopButton, toSmallCircle]
        animationGroup.duration = 0.25
        animationGroup.fillMode = kCAFillModeBoth
        animationGroup.isRemovedOnCompletion = false

        return animationGroup

    }

    @objc func tappedView(_ sender: UITapGestureRecognizer) {

        self.roundView?.layer.add(self.recordToStopAnimation(), forKey: "")

        isRecording = !isRecording
        delegate?.tapButton(isRecording: isRecording)

    }

    override open func prepareForInterfaceBuilder() {
        setupRecordButtonView()
    }

}

//
//  ViewController.swift
//  RecordButtonExample
//
//  Created by Pablo on 10/05/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recordButton: RecordButtonView?

    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.black
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let recordButtonSide = self.view.bounds.size.height/8
        recordButton = RecordButtonView(frame: CGRect(x: self.view.bounds.width/2-recordButtonSide,
                                                      y: self.view.bounds.height-recordButtonSide,
                                                      width: recordButtonSide,
                                                      height: recordButtonSide))
        recordButton?.delegate = self

        self.view.addSubview(recordButton!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension ViewController: RecordButtonDelegate {

    func tapButton(isRecording: Bool) {

        if isRecording {
            print("Start recording")
        } else {
            print("Stop recording")
        }
    }
}

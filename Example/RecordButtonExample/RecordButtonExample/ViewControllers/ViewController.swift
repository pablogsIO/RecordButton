//
//  ViewController.swift
//  RecordButtonExample
//
//  Created by Pablo on 10/05/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recordButton: RecordButton?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        let recordButtonSide = self.view.bounds.size.height/15
        recordButton = RecordButton(frame: CGRect(x: self.view.bounds.width/2-recordButtonSide/2,
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

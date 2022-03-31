//
//  ViewController.swift
//  UpDownGame
//
//  Created by 지희의 MAC on 2022/03/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderValueChanged ( sender: UISlider){
        print(sender.value)
    }

}


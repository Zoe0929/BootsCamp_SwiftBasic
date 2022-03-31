//
//  ViewController.swift
//  UpDownGame
//
//  Created by 지희의 MAC on 2022/03/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderValueChanged (_ sender: UISlider){
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton)
    {
        print(slider.value)
    }
    @IBAction func touchUpResetButton(_ sender: UIButton)
    {
        print("touch up Reset Button")
    }

}


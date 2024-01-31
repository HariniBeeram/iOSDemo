//
//  ViewController.swift
//  BeeramAlphaNumericFunApp
//
//  Created by Harini Beeram on 1/30/24.
//

import UIKit
import Lottie
class ViewController: UIViewController {
   
    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
        didSet{
                            LaunchLAV.animation = LottieAnimation.named("AnimationWelcome")
                            LaunchLAV.alpha = 1
                            LaunchLAV.play{ [weak self] _ in
                                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut]){
                                    self?.LaunchLAV.alpha = 0.0
                                }
                            }
                        }
    }
    @IBOutlet weak var headerSV: UIStackView!
    @IBOutlet weak var headerLBL: UILabel!
    @IBAction func selectcategory(_ sender: Any) {
    }
    
    @IBOutlet weak var outputTV: UITextView!
    @IBAction func secondNumberStepper(_ sender: Any) {
    }
    @IBAction func firstNumberStepper(_ sender: Any) {
    }
    @IBAction func uppercaseSWCH(_ sender: Any) {
    }
    @IBAction func lowercaseSWCH(_ sender: Any) {
    }
    @IBAction func inputStringTF(_ sender: Any) {
    }
    @IBOutlet weak var outputResetSV: UIStackView!
    @IBOutlet weak var numbersSV: UIStackView!
    @IBOutlet weak var firstnumberLBL: UILabel!
    @IBOutlet weak var StringsSV: UIStackView!
    @IBOutlet weak var secondNumberLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}


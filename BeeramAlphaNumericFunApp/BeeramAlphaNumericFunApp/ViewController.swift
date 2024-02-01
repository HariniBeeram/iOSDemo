import UIKit
import AnimatedGradientView
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var LaunchLAV: LottieAnimationView! {
        didSet {
            LaunchLAV.animation = LottieAnimation.named("AnimationWelcome")
            LaunchLAV.alpha = 1
            LaunchLAV.play { [weak self] _ in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut]) {
                    self?.LaunchLAV.alpha = 0.0
                }
            }
        }
    }
    
    @IBOutlet weak var lowercaseSWCH: UISwitch!
    @IBOutlet weak var inputStringTF: UITextField!
    @IBOutlet weak var headerSV: UIStackView!
    @IBOutlet weak var headerLBL: UILabel!
    
    @IBOutlet weak var outputTV: UITextView!
    
    @IBOutlet weak var outputResetSV: UIStackView!
    @IBOutlet weak var numbersSV: UIStackView!
    @IBOutlet weak var firstnumberLBL: UILabel!
    @IBOutlet weak var StringsSV: UIStackView!
    @IBOutlet weak var secondNumberLBL: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private func grid(){
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
        view.insertSubview(animatedGradient, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLBL.text = String(format: "%@\nHAVE SOME FUN™️","\u{0C38}\u{0C2D}\u{0C15}\u{0C41}\u{0C28}\u{0C2E}\u{0C4D}\u{0C15}\u{0C3E}\u{0C30}\u{0C02}")
        
        headerLBL.isEnabled = false
        outputTV.isEditable = false
        
      
        headerSV.layer.borderWidth = 1
        headerSV.layer.cornerRadius = 5
        
       
        numbersSV.layer.borderWidth = 1
        numbersSV.layer.cornerRadius = 5
        
        
        StringsSV.layer.borderWidth = 1
        StringsSV.layer.cornerRadius = 5
        
        
        outputResetSV.layer.borderWidth = 1
        outputResetSV.layer.cornerRadius = 5
        
        // Set initial text for outputTV
        outputTV.text = "Welcome!\n\nInteract with the UI elements and have some fun with numbers and strings, and patterns that are generated using them."
        self.grid()
        
        
    }

    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        updateOutputText()
    }

    @IBAction func secondNumberStepper(_ sender: UIStepper) {
        updateOutputText()
    }

    @IBAction func firstNumberStepper(_ sender: UIStepper) {
        updateOutputText()
    }

    func updateOutputText() {
        let firstNumberValue = Int(firstnumberLBL.text ?? "0") ?? 0
        let secondNumberValue = Int(secondNumberLBL.text ?? "0") ?? 0

        if segmentedControl.selectedSegmentIndex == 0 {
            if firstNumberValue > 0 {
                if secondNumberValue == 0 {
                    outputTV.text = "Use the 2nd number stepper to increment the number value."
                } else {
                    let result = firstNumberValue + secondNumberValue
                    outputTV.text = "Result: \(result)"
                }
            } else {
                outputTV.text = "Use the 1st number stepper to increment the number value."
            }
            
        } else  {
            // Handle logic for the pattern segment
            var patternOutput = ""
            for row in 1...firstNumberValue {
                for column in 1...secondNumberValue {
                    patternOutput += "\(row * column) "
                }
                patternOutput += "\n"
            }
            outputTV.text = patternOutput
        }
        
    }
    
}


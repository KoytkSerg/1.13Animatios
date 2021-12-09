//
//  ViewController.swift
//  HW13
//
//  Created by Sergii Kotyk on 12/4/21.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var ViewSize: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var ViewX: NSLayoutConstraint!
    @IBOutlet weak var ViewY: NSLayoutConstraint!
    @IBOutlet weak var animationNumber: UILabel!
    
    @IBAction func prevButton(_ sender: Any){
        if animNumber == 1 { animNumber = 7 } else {animNumber -= 1}
        animationNumber.text = String(animNumber)
        ShowAnimate(number: animNumber)
        self.mainView.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if animNumber == 7 { animNumber = 1 } else {animNumber += 1}
        animationNumber.text = String(animNumber)
        ShowAnimate(number: animNumber)
    }
    
    var animNumber = 1
    
    func ShowAnimate(number: Int){
        switch number {
        case 1:
            self.mainView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
                self.mainView.backgroundColor = UIColor.yellow
            } completion: { (isComplited) in
                self.mainView.backgroundColor = UIColor.red
            }
            
        case 2:
            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse){
                self.ViewX.constant = UIScreen.main.bounds.width / 2 - self.mainView.bounds.height / 2
                self.ViewY.constant = 0 - (UIScreen.main.bounds.height / 2 - self.mainView.bounds.width/2)
                self.view.layoutIfNeeded()
            } completion: { (isComplited) in
                self.ViewX.constant = 0
                self.ViewY.constant = 0
                self.view.layoutIfNeeded()
            }

        case 3:
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.fromValue = NSNumber(value: 0)
            animation.toValue = NSNumber(value: Float(mainView.bounds.width / 2))
            animation.duration = 2.0
            animation.autoreverses = true
            mainView.layer.add(animation, forKey: "cornerRadius")
            mainView.layer.cornerRadius = 0
                        
       case 4:
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }

        case 5:
            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
                self.mainView.alpha = 0
            } completion: { (isComplited) in
                self.mainView.alpha = 1
            }

        case 6:
            self.mainView.layer.removeAllAnimations()
            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
                self.ViewSize.constant *= 2
                self.view.layoutIfNeeded()
            } completion: { (isComplited) in
                self.ViewSize.constant /= 2
                self.view.layoutIfNeeded()
            }

        default:
            UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .curveLinear]) {
                self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor.red
        animationNumber.text = String(animNumber)
        ShowAnimate(number: animNumber)
    }
}


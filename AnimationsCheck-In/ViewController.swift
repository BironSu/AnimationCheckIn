//
//  ViewController.swift
//  AnimationsCheck-In
//
//  Created by Biron Su on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var duckImage: UIImageView!
    @IBOutlet weak var explodeButton: UIButton!
    private var animator: UIViewPropertyAnimator!
    var size: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
            self.duckImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        })
    }
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        if imageButton.imageView?.image == UIImage(named: "cat") {
            UIView.transition(with: imageButton, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                self.imageButton.setImage(UIImage(named: "dog"), for: .normal)
                self.label.text = "Image changed to a dog!"
            })
        } else {
            UIView.transition(with: imageButton, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                self.imageButton.setImage(UIImage(named: "cat"), for: .normal)
                self.label.text = "Image changed to a cat!"
            })
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
        label.text = "Duck size \(String(sender.value))"
        size = sender.value
    }
    @IBAction func explodePressed(_ sender: UIButton) {
        if duckImage.image == UIImage(named: "duck") {
            UIView.transition(with: duckImage, duration: 0.0, options: [], animations: {
                self.duckImage.image = UIImage(named: "explosion")
            }) { (done) in
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                    self.duckImage.transform = CGAffineTransform(scaleX: 100.0, y: 100.0)
                    self.duckImage.alpha = 0.0
                }) { (done) in
                    self.duckImage.image = UIImage(named: "duck")
                    self.duckImage.transform = CGAffineTransform.identity
                    self.animator.fractionComplete = CGFloat(self.size ?? 0.0)
                    self.duckImage.alpha = 1.0
                }
            }
        }
    }
}


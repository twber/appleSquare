//
//  ViewController.swift
//  appleSquare
//
//  Created by Bernice TSAI on 2020/9/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var patternSegmentedControl: UISegmentedControl!
    @IBOutlet weak var showSliderValue: UILabel!
    @IBOutlet weak var basketLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var content = ""
        for _ in 1...3{
            for _ in 1...3{
                content = content + "🍎"
            }
            content = content + "\n"
        }
        basketLabel.text = content
    }
    
    
    @IBAction func changeSlider(_ sender: UISlider) {
        let pattern = patternSegmentedControl.selectedSegmentIndex
        sender.value = sender.value.rounded()
        var number = Int(sender.value)
        showSliderValue.text = "\(number)"
        var content = ""
        
        switch pattern{
        case 0:// one pattern
            for _ in 1...number{
            for _ in 1...number{
                content = content + "🍎"
            }
            content = content + "\n"
        }
        case 1: //line
            for i in 1...number{
                for j in 1...number{
                    if i == number{
                    content = content + "🍎"
                    }else{
                        content = content + "🍏"
                    }
                }
                content = content + "\n"
            }
        case 2://diagonal
            for i in 1...number{
            for j in 1...number{
                if i==(number+1-j){
                content = content + "🍎"
                //diagonal red
                }else{
                    content = content + "🍏"
                }
            }
            content = content + "\n"
        }
        /*for i in 1...number{
         for j in 1...i{
             if i==j{
             content = content + "🍎"
             //triangle + diagonal red
             }else{
                 content = content + "🍏"
             }
         }
         content = content + "\n"
     }*/
        case 3: //alternated
        for i in 1...number{
            for j in 1...number{
                if i%2 == 0&&j%2 != 0 || i%2 != 0&&j%2 == 0{
                    content = content + "🍎"
                }else{
                    content = content + "🍏"
                }
            }
            content = content + "\n"
        }
        default:
            return
        }
        
        /*for i in 1...number{
            for j in 1...i{
                if j%2 != 0{
                // alternated columns
                content = content + "🍎"
                }else{
                    content = content + "🍏"
                }
            }
            content = content + "\n"
        }*/
            
        
        basketLabel.text = content
    }
    
}


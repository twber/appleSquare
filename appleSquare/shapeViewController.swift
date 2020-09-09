//
//  shapeViewController.swift
//  appleSquare
//
//  Created by Bernice TSAI on 2020/9/9.
//

import UIKit

class shapeViewController: UIViewController {
    
    @IBOutlet weak var basketView: UILabel!
    @IBOutlet weak var showSliderValue: UILabel!
    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        var content = ""
        for i in 1...3{
            for j in 1...3{
                if i==j{
                content = content + "🍏"
                //diagonal red
                }else{
                    content = content + "🍎"
                }
            }
            content = content + "\n"
        }
        basketView.text = content
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeShape(_ sender: UISlider) {
        let shape = shapeSegmentedControl.selectedSegmentIndex
        sender.value = sender.value.rounded()
        var number = Int(sender.value)
        showSliderValue.text = "\(number)"
        var content = ""
        switch shape{
        case 0: //square
            for i in 1...number{
             for j in 1...number{
                if i<j{//top
                content = content + "🥝"
                }else{//buttom
                content = content + "🍎"
            }
            }
            content = content + "\n"
        }
        case 1://triangle
            for i in 1...number{
             for j in 1...number+1-i{
                 if j==number+1-i{
                 content = content + "🥝"
                 //triangle + diagonal red
                 }else{
                     content = content + "🍎"
                 }
             }
             content = content + "\n"
         }
        case 2: //pyramid
            if number<8{
                var j: Int = 0
                for i in 1...number {
                   for _ in 1...number + 1 - i {
                       content += "🥝"
                   }
                   for j in 1...i {
                       content += "🍎"
                   }

                   j = i - 1
                   while j >= 1 {
                       content += "🍎"
                       j -= 1
                   }
                    content += "\n"
               }
            }
        case 3: //diamond
            /*row 1: print 3 spaces + 1 star
            row 2: print 2 spaces + 3 stars
            row 3: print 1 space  + 5 stars
            row 4: print 0 space  + 7 stars
            row 5: print 1 space  + 5 stars
            row 6: print 2 spaces + 3 stars
            row 7: print 3 spaces + 1 star*/
            
            if number>2, number%2 != 0 {
                for row in (1 ..< number + 1) {
                    var starCount = 0
                    var spaceCount = 0
                if (row <= (number / 2  + 1) ) {
                    starCount  = row * 2 - 1
                    spaceCount = (number/2 + 1) - row
              }else{
                    starCount  = (number - row) * 2 + 1
                spaceCount = row - (number/2+1)
              }
              
              var spaceInFront = String(repeating: "🥝", count: spaceCount);
              var stars = String(repeating: "🍎", count: starCount);
            
            print(spaceInFront+stars)
                
                content += spaceInFront+stars
                content += "\n"
                //content += stars
            }
                
            }
        default:
            return
        }
        basketView.text = content
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Assignment006-Tipster
//
//  Created by JD Penuliar on 7/11/16.
//  Copyright © 2016 JD Penuliar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalWithoutTip: UILabel!
    
    @IBOutlet weak var tipPercentage001: UILabel!
    
    @IBOutlet weak var tipPercentage002: UILabel!
    
    @IBOutlet weak var tipPercentage003: UILabel!
    
    @IBOutlet weak var tipAmount001: UILabel!
    @IBOutlet weak var tipAmount002: UILabel!
    @IBOutlet weak var tipAmount003: UILabel!
    
    @IBOutlet weak var totalAmount001: UILabel!
    @IBOutlet weak var totalAmount002: UILabel!
    @IBOutlet weak var totalAmount003: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    var xCharToFloat: String = "0"
    var x: Float = 0.0
    var isDecimal: Bool = false
    @IBOutlet weak var sliderPercentage: UISlider!
    
    @IBOutlet weak var sliderGroupSize: UISlider!
    
    @IBAction func sliderTipChanged(_ sender: UISlider) {
        compute(sliderPercentage.value, groupSize: sliderGroupSize.value, withTotal: Float(xCharToFloat)!)
    }
    
    @IBAction func sliderGroupSizeChanged(_ sender: UISlider) {
        groupSizeLabel.text = "Group Size: \(Int(sliderGroupSize.value))"
        compute(sliderPercentage.value, groupSize: sliderGroupSize.value, withTotal: Float(xCharToFloat)!)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        for i in 0...11{
            if sender.tag == 10{
                sliderPercentage.maximumValue * 0.10
                sliderGroupSize.value = 1
                self.xCharToFloat = "0"
                self.x = 0.0
                reset()
            }else if i == sender.tag{
                if sender.tag != 11{
                    if totalWithoutTip.text == "0.0"{
                        totalWithoutTip.text = ""
                        xCharToFloat = ""
                    }
                    xCharToFloat += String(sender.tag)
                    
                }else {
                    xCharToFloat += "."
                }
                compute(sliderPercentage.value, groupSize: sliderGroupSize.value, withTotal: Float(xCharToFloat)!)
            }

        }
    }
    func compute(_ tip: Float, groupSize: Float, withTotal: Float){
        print ("Tip: \(tip) Groupsize: \(floor(groupSize)) Total: \(withTotal)")
        if tip > 0 && groupSize > 0{
            totalWithoutTip.text = self.xCharToFloat
            tipPercentage001.text = String(Int(round(tip*100))) + "%"
            tipPercentage002.text = String(Int(round((tip + 0.05)*100))) + "%"
            
            tipPercentage003.text = String(Int(round((tip + 0.10)*100))) + "%"
            
            tipAmount001.text = String(withTotal * tip*groupSize)
            tipAmount002.text = String(withTotal * (tip + 0.05)*groupSize)
            tipAmount003.text = String(withTotal * (tip + 0.1)*groupSize)
            totalAmount001.text = String(((withTotal * tip) + withTotal)/round(groupSize))
            totalAmount002.text = String(((withTotal * (tip + 0.05)) + withTotal)/round(groupSize))
            totalAmount003.text = String(((withTotal * (tip + 0.1)) + withTotal)/round(groupSize))
        }
        
    }
    func reset(){
        totalWithoutTip.text = "0.0"
        tipPercentage001.text = "10%"
        tipPercentage002.text = "15%"
        tipPercentage003.text = "20%"
        tipAmount001.text = "0.0"
        tipAmount002.text = "0.0"
        tipAmount003.text = "0.0"
        totalAmount001.text = "0.0"
        totalAmount002.text = "0.0"
        totalAmount003.text = "0.0"
        groupSizeLabel.text = "Group size: 1"
        sliderPercentage.value = sliderPercentage.maximumValue * 0.10
        sliderGroupSize.value = 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        print (totalWithoutTip.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


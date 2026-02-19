//
//  ViewController2.swift
//  XanderMooreAssign2
//
//  Created by Moore, Xander J. on 2/18/26.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var mealsIntake: UITextField!;
    @IBOutlet weak var snacksIntake: UITextField!;
    
    @IBOutlet weak var stepsField: UITextField!;
    @IBOutlet weak var minutesField: UITextField!;
    
    @IBOutlet weak var balanceLbl: UILabel!;
    @IBOutlet weak var statusLbl: UILabel!;
    @IBOutlet weak var extraLbl: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func simulateDay(_ sender: Any) {
        let totalIntake = Double(mealsIntake.text!)! + Double(snacksIntake.text!)!;
        var totalBurn = 1800 + Double(stepsField.text!)! * 0.05;
        totalBurn += Double(minutesField.text!)! * 8;
        var diffKCal = totalIntake - totalBurn;
        
        if diffKCal > 0 {
            balanceLbl.text = "Eating is more than activity";
        }
        else if diffKCal < 0 {
            balanceLbl.text = "Activity is more than eating";
        }
        else {
            balanceLbl.text = "Eating matches activity";
        }
        
        let lbsChange = diffKCal / 3500;
        
        if lbsChange > 0 {
            statusLbl.text = "You will gain \(abs(lbsChange)) pound(s)";
        }
        else if lbsChange < 0 {
            statusLbl.text = "You will lose \(abs(lbsChange)) pound(s)";
        }
        else {
            statusLbl.text = "You will not gain or lose any weight";
        }
        
        diffKCal = abs(diffKCal);
        var steps = 0.0;
        
        while diffKCal > 0 {
            diffKCal -= 0.05;
            steps += 1.0;
        }
        
        extraLbl.text = "Extra steps needed to balance: \(steps) (~\(steps / 2000.0) miles)";
    }
    
}

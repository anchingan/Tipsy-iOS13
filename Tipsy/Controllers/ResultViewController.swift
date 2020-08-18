//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ching-An Tsai on 2020/8/18.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var splitAmount: String?
    var numberOfPeople: Int?
    var tip: Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = splitAmount
        settingLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(String(format:"%.0f", (tip ?? 0.0) * 100.0))% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

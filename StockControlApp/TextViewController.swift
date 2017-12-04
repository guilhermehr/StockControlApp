//
//  TextViewController.swift
//  StockControlApp
//
//  Created by Guilherme on 04/12/2017.
//  Copyright © 2017 Guilherme. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func sliderAction(_ sender: Any) {
        
        self.text.font = UIFont.systemFont(ofSize: CGFloat(slider.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

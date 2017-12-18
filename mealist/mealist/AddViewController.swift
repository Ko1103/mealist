//
//  AddViewController.swift
//  mealist
//
//  Created by 山浦功 on 2017/12/16.
//  Copyright © 2017年 KoYamaura. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func saveData(_ sender: Any) {
        let new = FoodViewModel.create()
        new.name = "test data"
        new.count = 3
        new.url = "https://github.com/Ko1103/mealist/blob/feature/%231_main_view/mealist/mealist/FoodViewModel.swift"
        new.note = "これはメモだよーー"
        new.created = NSDate()
        new.update()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

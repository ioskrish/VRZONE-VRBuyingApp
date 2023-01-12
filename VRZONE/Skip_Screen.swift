//
//  Skip_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 07/10/1944 Saka.
//

import UIKit

class Skip_Screen: UIViewController {

    @IBOutlet weak var nextbtn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func move_back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func move_to_profile(_ sender: UIButton) {
        let move  = storyboard?.instantiateViewController(withIdentifier: "Profile_Screen") as! Profile_Screen
        self.navigationController?.pushViewController(move, animated: true)
    }
}

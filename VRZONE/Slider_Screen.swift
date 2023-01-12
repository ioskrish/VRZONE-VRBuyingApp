//
//  Slider_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 07/10/1944 Saka.
//

import UIKit

class Slider_Screen: UIViewController {

    @IBOutlet weak var skipbtn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func move_to_profile(_ sender: UIButton) {
        let move  = storyboard?.instantiateViewController(withIdentifier: "Profile_Screen") as! Profile_Screen
        self.navigationController?.pushViewController(move, animated: true)
        
    }
    
    @IBAction func move_to_next(_ sender: UIButton) {
        let move  = storyboard?.instantiateViewController(withIdentifier: "Skip_Screen") as! Skip_Screen
        self.navigationController?.pushViewController(move, animated: true)
    }
}

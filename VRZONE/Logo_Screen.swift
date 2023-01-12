//
//  Logo_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 07/10/1944 Saka.
//

import UIKit

class Logo_Screen: UIViewController {
    
    //App logo
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Directed to HomePage
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        logo.isHidden = true
        do{
            sleep(4)
        }
        let move = storyboard?.instantiateViewController(withIdentifier: "Slider_Screen" ) as! Slider_Screen
        self.navigationController?.pushViewController(move, animated: true)
    }

}

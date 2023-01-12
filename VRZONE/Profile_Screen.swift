//
//  Profile_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 07/10/1944 Saka.
//

import UIKit

class Profile_Screen: UIViewController {

    @IBOutlet weak var profile_btn: UIButton!
    @IBOutlet weak var skipbtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        for family: String in UIFont.familyNames
                {
                    print(family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }
         */
        
        profile_btn.layer.cornerRadius = 20
        profile_btn.layer.borderWidth = 0.5
        profile_btn.titleLabel?.font = UIFont(name: "LexendMega-SemiBold", size: 17)
        profile_btn.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
    }
    
    
    @IBAction func go_to_move(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login_Screen" ) as! Login_Screen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func skip_to_home(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Home_Screen" ) as! Home_Screen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

//extension for using customized colors
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


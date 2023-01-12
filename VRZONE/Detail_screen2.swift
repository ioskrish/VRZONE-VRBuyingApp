//
//  Detail_screen2.swift
//  VRZONE
//
//  Created by TryCatch on 10/01/23.
//

import UIKit

class Detail_screen2: UIViewController {

    @IBOutlet weak var MainView: UIView!
    
    //Stack1 Content
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var heart_btn: UIButton!
    
    //Stack2 Content
    @IBOutlet weak var Image_holder: UIImageView!
    
    //Stack3 Content
    @IBOutlet weak var Holding_view: UIView!
    @IBOutlet weak var name_pass: UILabel!
    @IBOutlet weak var gb1: UIButton!
    @IBOutlet weak var gb2: UIButton!
    
    //Creating variables for data passing
    var vr_name = ""
    var vr_img = UIImage()
    var vr_url: URL!

    //Stack4
    @IBOutlet weak var buy_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //data passing from variables to components
        name_pass.text = vr_name
        Image_holder.image = vr_img

        Holding_view.layer.cornerRadius = 15
        
        buy_btn.layer.cornerRadius = 20
        buy_btn.layer.borderWidth = 2
        buy_btn.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        gb1.layer.cornerRadius = 15
        gb1.layer.borderWidth = 2
        gb1.layer.borderColor = UIColor(rgb: 0xB88B8F).cgColor
        
        gb2.layer.cornerRadius = 15
        gb2.layer.borderWidth = 2
        gb2.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buy_link(_ sender: UIButton) {
        let link = storyboard?.instantiateViewController(withIdentifier: "Link_Screen") as! Link_Screen
        link.receivedUrl = URL(string: "https://www.amazon.in/s?k=top+vr+headset&crid=32IJTZSZKJ9QO&sprefix=top+vr+headset%2Caps%2C188&ref=nb_sb_noss_1")
        self.navigationController?.pushViewController(link, animated: true)
    }
}

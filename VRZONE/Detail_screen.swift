//
//  Detail_screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 13/10/1944 Saka.
//

import UIKit
import Kingfisher

class Detail_screen: UIViewController {
    
    @IBOutlet weak var MainView: UIView!
    
    //Stack1 Content
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var heart_btn: UIButton!
    
    //Stack2 Content
    @IBOutlet weak var Image_holder: UIImageView!
    
    //Stack3 Content
    @IBOutlet weak var Holding_view: UIView!
    @IBOutlet weak var name_pass: UILabel!
    @IBOutlet weak var brand_pass: UILabel!
    @IBOutlet weak var gb1: UIButton!
    @IBOutlet weak var gb2: UIButton!
    
    //Creating variables for data passing
    var vr_name = ""
    var vr_brand = ""
    var vr_imageUrl = ""
    var vr_url: URL!

    //Stack4
    @IBOutlet weak var buy_btn: UIButton!
    
    //Model loaded
    var arrayofBrandList = [BrandModel]()
    var arrayofProductsItem = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //data passing from variables to components
        
        name_pass.text = vr_name
        brand_pass.text = vr_brand

        let url = URL(string: vr_imageUrl)
        Image_holder.kf.setImage(with: url)
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
        link.receivedUrl = vr_url
        self.navigationController?.pushViewController(link, animated: true)
    }
}

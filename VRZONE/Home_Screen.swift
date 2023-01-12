//
//  Home_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 29/12/22.
//

import UIKit
import Kingfisher

class Home_Screen: UIViewController {
    
    //UI Components
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var MainContentView: UIView!
    @IBOutlet weak var Stack_for_Views: UIStackView!
    
    //View1
    @IBOutlet weak var Content1: UIView!
    @IBOutlet weak var name_lbl: UILabel!
    var receivedName: String!
    
    //View2
    @IBOutlet weak var Content2: UIView!
    @IBOutlet weak var DeviceView: UIView!
    @IBOutlet weak var Collect1: UICollectionView!

    //View3
    @IBOutlet weak var Content3: UIView!
    @IBOutlet weak var VRView: UIView!
    @IBOutlet weak var Collect2: UICollectionView!
    
    
    //View4
    @IBOutlet weak var Content4: UIView!
    @IBOutlet weak var OfferView: UIView!
    @IBOutlet weak var DealView1: UIView!
    @IBOutlet weak var Dealview2: UIView!
    @IBOutlet weak var buy1: UIButton!
    @IBOutlet weak var buy2: UIButton!
    
    //View5
    @IBOutlet weak var Content5: UIView!
    @IBOutlet weak var popular_view: UIView!
    @IBOutlet weak var Collect3: UICollectionView!
    
    var selectedIndex = 0               // menu item index
    var selectedBrandName = ""          // menu item name
    
    var vr_product = ["Oculus Quest 2","PlayStation VR","Playstation VR 2","Valve Index","HTC VIVE Pro 2","HTC Vive Cosmos Elite",
                      "HTC VIVE Focus 3","HTC VIVE Pro","HTC Android VIVE","HP Reverb G2","HP Reverb","Pimax 8K X","Pimax 5K Super",
                      "Pimax Reality 12K","Varjo Aero","Varjo XR-3","Varjo VR-3","PICO 4","Pico neo 3 Pro","Pico G2","Samsung Gear VR",
                      "Google Daydream View","Pansonite VR with Controller","Irusu Play VR with Headset","Irusu Monster VR Headset",
                      "Irusu Mini VR with Headset","Procus ONE"]
    
    //Model loaded
    var arrayofBrandList = [BrandModel]()
    var arrayofProductsItem = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //passed name from login screen
        name_lbl.text = receivedName
        
        //Content5 creative properties
        DealView1.layer.cornerRadius = 15
        Dealview2.layer.cornerRadius = 15
        
        buy1.layer.cornerRadius = 20
        buy1.layer.borderWidth = 2
        buy1.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        buy2.layer.cornerRadius = 20
        buy2.layer.borderWidth = 2
        buy2.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        //Collection View1
        Collect1.delegate = self
        Collect1.dataSource = self
        
        //Collection View2
        Collect2.delegate = self
        Collect2.dataSource = self
        
        //Collection View3
        Collect3.delegate = self
        Collect3.dataSource = self
        
        //API-1 call
        getBrandList()
    }
    
    // MARK: - API-1 WORK
    func getBrandList() {
        guard let url = URL(string: "https://mapi.trycatchtech.com/v3/oculus/oculus_brand_list")
        else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let jsondata = try JSONDecoder().decode([BrandModel].self, from: data)
                   
                    //print(jsondata)
                    DispatchQueue.main.async {
                        self.arrayofBrandList = jsondata
                        if self.arrayofBrandList.count > 0 {
                            self.selectedIndex = Int(self.arrayofBrandList[0].id) ?? 0
                            self.selectedBrandName = self.arrayofBrandList[0].catName
                        }
                        self.Collect1.reloadData()
                        self.getCategoryItemList()
                    }
                    
                }catch {
                    print("somthing went wrong")
                }
            }
        }.resume()
    }
    
    // MARK: - API-2 WORK
    func getCategoryItemList() {
        
        guard let url = URL(string: "https://mapi.trycatchtech.com/v3/oculus/oculus_product_list?category_id=\(selectedIndex)")
        else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let jsondata = try JSONDecoder().decode([ProductModel].self, from: data)
                   
                    //print(jsondata)
                    DispatchQueue.main.async {
                        self.arrayofProductsItem = jsondata
                        self.Collect2.reloadData()
                    }
                    
                }catch {
                    print("somthing went wrong")
                }
            }
        }.resume()
    }
    
    @IBAction func buy_link1(_ sender: UIButton) {
        let link = storyboard?.instantiateViewController(withIdentifier: "Link_Screen") as! Link_Screen
        link.receivedUrl = URL(string: "https://www.amazon.in/Virtual-Reality-Headset-Headphones-Controller/dp/B097JY28RX/ref=sr_1_3?crid=2PO4ZOUQTZR72&keywords=irusu+play+vr&qid=1673079244&sprefix=irusu+play+v%2Caps%2C417&sr=8-3")
        self.navigationController?.pushViewController(link, animated: true)
    }
    
    @IBAction func buy_link2(_ sender: UIButton) {
        let link = storyboard?.instantiateViewController(withIdentifier: "Link_Screen") as! Link_Screen
        link.receivedUrl = URL(string: "https://deviestore.com/product/varjo-aero-virtual-reality-headset-2/?gclid=EAIaIQobChMI6O-5ysCZ_AIVNpNmAh3WBQvuEAQYASABEgKiKvD_BwE")
        self.navigationController?.pushViewController(link, animated: true)
    }

    @IBAction func search_for(_ sender: UIButton) {
        let search = storyboard?.instantiateViewController(withIdentifier: "Search_Screen") as! Search_Screen
        self.navigationController?.pushViewController(search, animated: true)
    }
    
}

extension Home_Screen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == Collect1) {
            return arrayofBrandList.count
        }
        else if (collectionView == Collect2) {
            return arrayofProductsItem.count
        }
        else{
            return vr_product.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == Collect1) {
            let data = arrayofBrandList[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! DeviceCellClass
            if selectedIndex == Int(data.id) {
                cell.backgroundColor = UIColor(white: 0xF4DAD6,alpha: 0.18)
            } else {
                cell.backgroundColor = .clear
            }
            
            cell.device_name.text = data.catName
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        return cell
        
        }
        else if (collectionView == Collect2) {
        let cell = Collect2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! DeviceCellClass2
        let data2 = arrayofProductsItem[indexPath.item]
        
        let url = ImageResource(downloadURL: URL(string: data2.postImage)!)
        cell.vr_img.kf.setImage(with: url)
            
        cell.vr_name.text = data2.postName
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        return cell
        }
        else{
            let cell = Collect3.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! DeviceCellClass3
            cell.vr_img.image = UIImage(named: vr_product[indexPath.item])
            cell.vr_name.text = vr_product[indexPath.item]
            cell.layer.cornerRadius = 15
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == Collect1) {
        let width = ((collectionView.frame.width - 22)/3)
        let height = ((collectionView.frame.height - 2)/1 )
        
        return CGSize(width: width, height: height)
        }
        
        else{
        let width = ((collectionView.frame.width - 10)/2)
        let height = ((collectionView.frame.height - 2)/1 )
        
        return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (collectionView == Collect1) {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
        else{
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (collectionView == Collect1) {
        return 10
        }
        else{
        return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == Collect1) {
            let data = arrayofBrandList[indexPath.item]
            guard let id = Int(data.id) else {
                // Not id found
                return
            }
            selectedIndex = id
            selectedBrandName = data.catName
            Collect1.reloadData()
            getCategoryItemList()
        } else if (collectionView == Collect2) {
            let detail = storyboard?.instantiateViewController(withIdentifier: "Detail_screen" ) as! Detail_screen
            detail.vr_imageUrl = arrayofProductsItem[indexPath.item].postImage
            detail.vr_brand = selectedBrandName
            detail.vr_name = arrayofProductsItem[indexPath.item].postName
            detail.vr_url = arrayofProductsItem[indexPath.item].postURL
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }

}


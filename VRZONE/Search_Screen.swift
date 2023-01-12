//
//  Search_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 16/10/1944 Saka.
//

import UIKit

class Search_Screen: UIViewController {

    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var Collect4: UICollectionView!
    var vr_product = ["Oculus Quest 2","PlayStation VR","Playstation VR 2","Valve Index","HTC VIVE Pro 2","HTC Vive Cosmos Elite",
                      "HTC VIVE Focus 3","HTC VIVE Pro","HTC Android VIVE","HP Reverb G2","HP Reverb","Pimax 8K X","Pimax 5K Super","Pimax Reality 12K","Varjo Aero","Varjo XR-3","Varjo VR-3","PICO 4","Pico neo 3 Pro","Pico G2","Samsung Gear VR","Google Daydream View","Pansonite VR with Controller","Irusu Play VR with Headset","Irusu Monster VR Headset","Irusu Mini VR with Headset","Procus ONE"]
    
    var isSearching = false
    var searchedItem = [String]()
    
    //Model loaded
    var arrayofBrandList = [BrandModel]()
    var arrayofProductsItem = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Collection 4
        Collect4.delegate = self
        Collect4.dataSource = self
        
        SearchBar.searchTextField.leftView?.tintColor = .white
        SearchBar.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        SearchBar.layer.borderWidth = 2
        SearchBar.layer.cornerRadius = 20
        SearchBar.delegate = self
    }
    
    @IBAction func go_back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension Search_Screen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching{
            return searchedItem.count
        }
        else{
            return vr_product.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Collect4.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! DeviceCellClass4
        if isSearching{
            cell.vr_img.image = UIImage(named: searchedItem[indexPath.row])
            cell.vr_name.text = searchedItem[indexPath.row]
        }
        else{
            cell.vr_name.text = vr_product[indexPath.row]
            cell.vr_img.image = UIImage(named: vr_product[indexPath.row])
        }
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15)/2)
        let height = ((collectionView.frame.height - 32)/3 )
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = storyboard?.instantiateViewController(withIdentifier: "Detail_screen2") as! Detail_screen2
        if isSearching{
            detail.vr_img = UIImage(named: searchedItem[indexPath.row])!
            detail.vr_name = searchedItem[indexPath.row]
        }
        else{
            detail.vr_img = UIImage(named: vr_product[indexPath.row])!
            detail.vr_name = vr_product[indexPath.row]
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension Search_Screen: UISearchBarDelegate {
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         searchedItem = vr_product.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
         isSearching = true
         Collect4.reloadData()
     }
     
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         isSearching = false
         SearchBar.text = ""
         Collect4.reloadData()
     }
 }

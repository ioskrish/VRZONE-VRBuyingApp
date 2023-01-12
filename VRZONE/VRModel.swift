//
//  VRModel.swift
//  VRZONE
//
//  Created by TryCatch Classes on 14/10/1944 Saka.
//

import Foundation

struct BrandModel: Codable {
    //Brand List
    let id: String
    let catName: String
    let catOrder: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case catName = "cat_name"
        case catOrder = "cat_order"
    }
}

struct ProductModel: Codable {
    //Product List
    let id, postName: String
    let postImage: String
    let postURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case postName = "post_name"
        case postImage = "post_image"
        case postURL = "post_url"
    }
}



//
//  Link_Screen.swift
//  VRZONE
//
//  Created by TryCatch Classes on 16/10/1944 Saka.
//

import UIKit
import WebKit

class Link_Screen: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var WView: WKWebView!
    var receivedUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WView.navigationDelegate = self
        let request = URLRequest(url: receivedUrl)
        WView.load(request)
        WView.allowsBackForwardNavigationGestures = true
    }
    @IBAction func back_to_vc(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

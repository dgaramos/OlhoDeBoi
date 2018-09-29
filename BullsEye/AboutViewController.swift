//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Danilo Ramos on 29/09/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webViewLoad(url: "https://github.com/dgaramos")
    }
    
    @IBAction func displayGitHub() {
        webViewLoad(url: "https://github.com/dgaramos")
    }
    
    func webViewLoad(url: String){
        let url = URL(string:url)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    

}

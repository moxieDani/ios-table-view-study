//
//  AttractionDetailViewController.swift
//  TableViewStory
//
//  Created by HanGyo Jeong on 12/05/2019.
//  Copyright © 2019 HanGyoJeong. All rights reserved.
//

import UIKit
import WebKit

class AttractionDetailViewController: UIViewController {

    var webSite: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let address = webSite{
            let webURL = NSURL(string: address)
            let urlRequest = NSURLRequest(url: webURL! as URL)
            webView.load(urlRequest as URLRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

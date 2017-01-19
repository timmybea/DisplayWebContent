//
//  ViewController.swift
//  DisplayWebContent
//
//  Created by Tim Beals on 2017-01-19.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: "https://www.youtube.com/") {
            let urlRequest = URLRequest(url: url)
             webView.loadRequest(urlRequest)
        }
        
        //Load HTML from file
//        self.webView.loadRequest(NSURLRequest(URL: NSBundle.mainBundle().URLForResource("index", withExtension: "html", subdirectory: "faq")!))
    }

    
    @IBAction func backAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    @IBAction func forwardAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    @IBAction func stopAction(_ sender: Any) {
        webView.stopLoading()
    }
    
    
    @IBAction func refreshAction(_ sender: Any) {
        webView.reload()
    }
    
}


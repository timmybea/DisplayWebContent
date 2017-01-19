//
//  ViewController.swift
//  DisplayWebContent
//
//  Created by Tim Beals on 2017-01-19.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = URL(string: "https://www.google.com/") {
            let urlRequest = URLRequest(url: url)
             webView.loadRequest(urlRequest)
        }
        
        //Load HTML from file
//        self.webView.loadRequest(NSURLRequest(URL: NSBundle.mainBundle().URLForResource("index", withExtension: "html", subdirectory: "faq")!))
    }

    //MARK: basic webview functions
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
    
    //MARK: webview delegate functions
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        navigationTitle.title = webView.stringByEvaluatingJavaScript(from: "document.title")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}


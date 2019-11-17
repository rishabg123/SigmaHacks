//
//  liveScheduleViewController.swift
//  BruinsApp
//
//  Created by Rishab Gupta on 10/22/19.
//  Copyright © 2019 Rishab Gupta. All rights reserved.
//

import UIKit
import WebKit


class liveScheduleViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
                      // Always adopt a light interface style.
                      overrideUserInterfaceStyle = .light
                  }
        webView.navigationDelegate = self
        let url = URL(string: "https://bell.plus/schs")
        let request = URLRequest(url: url!)
        self.webView.load(request)
}
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}

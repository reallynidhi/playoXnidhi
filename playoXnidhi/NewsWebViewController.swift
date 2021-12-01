//
//  NewsWebViewController.swift
//  playoXnidhi
//
//  Created by Nidhi Soni on 01/12/21.


import UIKit
import WebKit

class NewsWebViewController: UIViewController {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var contentView: UIView!

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        newsTitle.text = UserDefaults.standard.string(forKey: "title")
        
       let contentUrl = UserDefaults.standard.string(forKey: "content")
        
        guard let url = URL(string: contentUrl ?? "") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = contentView.frame
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.removeObject(forKey:"title")
        UserDefaults.standard.removeObject(forKey:"content")
    }
    
    @IBAction func crossBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
       
    }
    
}

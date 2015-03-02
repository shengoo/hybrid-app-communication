//
//  ViewController.swift
//  HybridApp
//
//  Created by sheng qing on 15/3/2.
//  Copyright (c) 2015年 sheng qing. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKScriptMessageHandler {

    @IBOutlet weak var view1: UIView!

    @IBOutlet weak var textField: UITextField!
    
    var theWebView:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSBundle.mainBundle().URLForResource("test", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        
        var theConfiguration = WKWebViewConfiguration()
        theConfiguration.userContentController.addScriptMessageHandler(self,
            name: "ios")
        theWebView = WKWebView(frame: view1.frame,
            configuration: theConfiguration)

        //theWebView.setNeedsLayout()
        //theWebView.frame.size.height = view1.frame.height;
        
        theWebView!.loadRequest(request)
        view1.addSubview(theWebView!)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage){
        textField.text = "\(message.body)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick() {
        if textField.text != ""{
            var js = "setTxt(\"\(textField.text)\")"
            println(js)
            theWebView!.evaluateJavaScript(js, completionHandler: nil)
        }
    }

}


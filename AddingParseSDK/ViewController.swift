//
//  ViewController.swift
//  AddingParseSDK
//
//  Created by Joren Winge on 12/8/17.
//  Copyright © 2017 Back4App. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        askToSendPushnotifications()
    }

    func askToSendPushnotifications() {
        let alertView = UIAlertController(title: "Send a push to the news channel", message: nil, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            self.sendPushNotifications()
        }
        alertView.addAction(OKAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
        }
        alertView.addAction(cancelAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }

    func sendPushNotifications() {
        let cloudParams : [AnyHashable:String] = [:]
        PFCloud.callFunction(inBackground: "pushsample", withParameters: cloudParams, block: {
            (result: Any?, error: Error?) -> Void in
            if error != nil {
                if let descrip = error?.localizedDescription{
                    print(descrip)
                }
            }else{
                print(result as! String)
            }
        })
    }

}


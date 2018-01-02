//
//  ViewController.swift
//  Sample
//
//  Created by xiaopeng on 2017/7/28.
//  Copyright © 2017年 putao. All rights reserved.
//

import UIKit
import PTLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func logDebug(_ sender: Any) {
        log.debug("debug")
    }
    
    @IBAction func logInfo(_ sender: Any) {
        log.info("info")
    }
    
    @IBAction func logError(_ sender: Any) {
        log.error("error")
    }
    
    @IBAction func show(_ sender: Any) {
        let logVC = PTLogViewController()
        present(logVC, animated: true, completion: nil)
    }
}


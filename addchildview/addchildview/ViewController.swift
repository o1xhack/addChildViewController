//
//  ViewController.swift
//  addchildview
//
//  Created by wyx on 06/03/2017.
//  Copyright © 2017 Yuxiao Wang. All rights reserved.
//

import UIKit
import SafariServices
import SnapKit

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    // Insert two web link to test the child view
    let main: String = "http://o1xhack.com/2017/02/21/infoit/"
    let update: String = "http://o1xhack.com"
    
    
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var showView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showView.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.height.equalTo(self.view).multipliedBy(0.9)
        }
        
        change.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(showView)
            make.bottom.equalTo(self.view).multipliedBy(0.967)
            make.height.equalTo(self.view).multipliedBy(0.034)
        }
        
        let svc = SFSafariViewController(url: URL(string: main)!)
        svc.delegate = self
        
        self.addChildViewController(svc)
        self.showView.addSubview(svc.view)
        svc.didMove(toParentViewController: self)
        
        svc.view.snp.makeConstraints{ (make) -> Void in
            make.edges.equalTo(self.showView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeWebsite(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: update)!)
        svc.delegate = self
        
        self.addChildViewController(svc)
        self.showView.addSubview(svc.view)
        svc.didMove(toParentViewController: self)
        
        svc.view.snp.makeConstraints{ (make) -> Void in
            make.edges.equalTo(self.showView)
        }
    }

}


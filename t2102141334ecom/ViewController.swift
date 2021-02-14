//
//  ViewController.swift
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        showLogin1()
    }
     
    func showLogin1() {
        ZmFunc().dlog("ViewController - showLogin1")
        
        let login1View = Login1View()
        login1View.isModalInPresentation = true
        login1View.modalPresentationStyle = .fullScreen
        present(login1View, animated: true)
    }


}


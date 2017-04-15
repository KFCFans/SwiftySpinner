//
//  ViewController.swift
//  SwiftySpinner
//
//  Created by lip on 17/4/15.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SwiftySpinnerDelegate {
    
    lazy var spinnerview = SwiftySpinner(frame: UIScreen.main.bounds)
    
    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

    let datalist = ["我是列表 1","我是列表 2","我是列表 3","我是列表 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        btn.setTitle(datalist.first ?? "", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(showSpinnerView), for: .touchUpInside)
        navigationItem.titleView = btn
        spinnerview.delegate = self
        spinnerview.datalist = datalist
        spinnerview.reloadData()
        automaticallyAdjustsScrollViewInsets = false
        
    }
    @objc private func showSpinnerView(){

        if !spinnerview.isOnView{
            view.insertSubview(spinnerview, belowSubview: (navigationController?.navigationBar)!)
            spinnerview.showSpinner()
        }else{
            spinnerview.removeSpinner()
        }
    }
    
    func swiftySpinnerDidSelectRowAt(cell: SwiftySpinnerCell, row: Int) {
        btn.setTitle(datalist[row], for: .normal)
    }
    
    func swiftySpinnerDidChangeStatus(isOnView: Bool) {
        
    }
    

}


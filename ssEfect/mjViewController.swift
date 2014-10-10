//
//  mjViewController.swift
//  ssEfect
//
//  Created by gaoyong on 14-10-10.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

import UIKit

class mjViewController: UIViewController,UIScrollViewDelegate {

    var contentView:UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        contentView = UIScrollView(frame: CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height))
        contentView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 300)
        contentView.delegate = self
        contentView.backgroundColor = UIColor.yellowColor()
        contentView.alwaysBounceVertical = true
        self.view.addSubview(contentView)
        
        self.view.backgroundColor = UIColor.greenColor()
        
        setContentView()
    }
    
    func setContentView()
    {
        let downView = UIView(frame: CGRectMake(0, 300, self.view.bounds.size.width, contentView.contentSize.height - 300 - 64))
        downView.backgroundColor = UIColor.blueColor()
        downView.alpha = 1;
        contentView .addSubview(downView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

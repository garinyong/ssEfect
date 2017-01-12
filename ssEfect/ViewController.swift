//
//  ViewController.swift
//  ssEfect
//
//  Created by gaoyong
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate
{

    let maxDistance = CGFloat(50)
    let imgViewHeight = CGFloat(200)
    let overScreenHeight = CGFloat(300)
    var begingContentOffset = CGFloat(0)
    
    var contentView : UIScrollView!
    var showImgView : UIImageView!
    var detailView : UIView!
    var smallWindowView : UIView!
    var secondaryViewController : ccMapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white;
        
        showImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width,height: imgViewHeight))
        showImgView.center = CGPoint(x: showImgView.center.x,y: (66 + imgViewHeight)/2)
        showImgView.image = UIImage(named: "123.png")
        showImgView.backgroundColor = UIColor.clear;
        showImgView.contentMode = UIViewContentMode.center;
        self.view.addSubview(showImgView)
        
        contentView = UIScrollView(frame: self.view.bounds)
        contentView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.height + overScreenHeight)
        contentView.delegate = self
        contentView.scrollsToTop = false
        self.view.addSubview(contentView)
        
        //图的下半部分，自由构造，此处放了一个视差效果的地图
        detailView = UIView(frame: CGRect(x: 0, y: imgViewHeight, width: self.view.bounds.width, height: self.view.bounds.size.height - imgViewHeight + overScreenHeight))
        detailView.backgroundColor = UIColor(red: 89/255.0, green: 136/255.0, blue: 120/255.0, alpha: 1)
        contentView .addSubview(detailView)
        
        smallWindowView = UIView(frame: CGRect(x: 0, y: 30, width: self.view.bounds.size.width, height: 200))
        smallWindowView.clipsToBounds = true
        detailView.addSubview(smallWindowView)
        
        secondaryViewController = ccMapViewController();
        secondaryViewController.view.center = smallWindowView.center;
        smallWindowView.addSubview(secondaryViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //scrollview delegate
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        begingContentOffset = scrollView.contentOffset.y;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let curContentOffset = scrollView.contentOffset.y;
        
        if curContentOffset < 0
        {
            secondaryViewController.view.center = CGPoint(x: smallWindowView.center.x,y: smallWindowView.center.y-abs(curContentOffset)*0.3);
        }
        else
        {
            secondaryViewController.view.center = CGPoint(x: smallWindowView.center.x,y: smallWindowView.center.y+abs(curContentOffset)*0.3);
        }
        
        showImgView.center = CGPoint(x: showImgView.center.x, y: (66 + imgViewHeight - curContentOffset)/2);
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        let endDraggingContentOffset = scrollView.contentOffset.y;
        
        if endDraggingContentOffset > 0
        {
            return;
        }
        
        //向下
        if endDraggingContentOffset < begingContentOffset
        {
            if abs(endDraggingContentOffset - begingContentOffset) > maxDistance
            {
                excXiaHua(true)
            }
        }
        else
        {
            if abs(endDraggingContentOffset - begingContentOffset) > maxDistance
            {
                excXiaHua(false)
            }
        }
    }
    
    func excXiaHua(_ isXiaHua : Bool)
    {
        let xiaJuli = self.view.bounds.size.height - imgViewHeight;
        
        if isXiaHua
        {
            contentView.setContentOffset(CGPoint(x: 0, y: -xiaJuli), animated: true)
        }
        else
        {
            contentView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
}


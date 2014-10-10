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
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        showImgView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.size.width,imgViewHeight))
        showImgView.center = CGPointMake(showImgView.center.x,(66 + imgViewHeight)/2)
        showImgView.image = UIImage(named: "123.png")
        showImgView.backgroundColor = UIColor.clearColor();
        showImgView.contentMode = UIViewContentMode.Center;
        self.view.addSubview(showImgView)
        
        contentView = UIScrollView(frame: self.view.bounds)
        contentView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.height + overScreenHeight)
        contentView.delegate = self
        contentView.scrollsToTop = false
        self.view.addSubview(contentView)
        
        //图的下半部分，自由构造，此处放了一个视差效果的地图
        detailView = UIView(frame: CGRectMake(0, imgViewHeight, self.view.bounds.width, self.view.bounds.size.height - imgViewHeight + overScreenHeight))
        detailView.backgroundColor = UIColor(red: 89/255.0, green: 136/255.0, blue: 120/255.0, alpha: 1)
        contentView .addSubview(detailView)
        
        smallWindowView = UIView(frame: CGRectMake(0, 30, self.view.bounds.size.width, 200))
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
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
        begingContentOffset = scrollView.contentOffset.y;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let curContentOffset = scrollView.contentOffset.y;
        
        if curContentOffset < 0
        {
            secondaryViewController.view.center = CGPointMake(smallWindowView.center.x,smallWindowView.center.y-abs(curContentOffset)*0.3);
        }
        else
        {
            secondaryViewController.view.center = CGPointMake(smallWindowView.center.x,smallWindowView.center.y+abs(curContentOffset)*0.3);
        }
        
        showImgView.center = CGPointMake(showImgView.center.x, (66 + imgViewHeight - curContentOffset)/2);
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        
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
    
    func excXiaHua(isXiaHua : Bool)
    {
        let xiaJuli = self.view.bounds.size.height - imgViewHeight;
        
        if isXiaHua
        {
            contentView.setContentOffset(CGPointMake(0, -xiaJuli), animated: true)
        }
        else
        {
            contentView.setContentOffset(CGPointZero, animated: true)
        }
    }
}


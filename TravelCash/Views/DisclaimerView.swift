//
//  DisclaimerView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class DisclaimerView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let cancelBtn = UIButton()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        
        titleLabel.text = ""
        titleLabel.font = UIFont(name: "OpenSans", size: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        cancelBtn.setTitle("OK", for: .normal)
        cancelBtn.backgroundColor = Global.colorMidBlue
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        cancelBtn.clipsToBounds = true
        cancelBtn.titleLabel?.lineBreakMode = .byWordWrapping
        cancelBtn.titleLabel?.textAlignment = .center
        
        containerView.addSubview(titleLabel)
        scrollView.addSubview(containerView)
        addSubview(scrollView)        
        addSubview(cancelBtn)
        
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            scrollView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            scrollView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            scrollView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            scrollView.autoPinEdge(.bottom, to: .top, of: cancelBtn, withOffset: -10)
            
            containerView.autoPinEdgesToSuperviewEdges()
            containerView.autoMatch(.width, to: .width, of: self)
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)

            cancelBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            cancelBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            cancelBtn.autoSetDimensions(to: CGSize(width: 80, height: 30))
        }
    }
    
    func bindingData(content: String) {
        titleLabel.text = content
    }
}

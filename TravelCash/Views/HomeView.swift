//
//  HomeView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let pageControl = UIPageControl()
    
    let iconImgView = UIImageView()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: PromotionCollectionViewFlowLayout())
    let newLoanRequestButton = UIButton()
    let applyForLoanButton = UIButton()
    let orLabel = UILabel()
    let leftLine = UIView()
    let rightLine = UIView()
    let newUserButton = UIButton()
    let alreadyHaveAccountLabel = UILabel()
    let signInButton = UIButton()
    let contactUsButton = UIButton()

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = Global.colorHome
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = UIColor.white

        
//        iconImgView.clipsToBounds = true
//        iconImgView.contentMode = .scaleAspectFit
//        iconImgView.image = UIImage(named: "icon")
        
        let p: CGFloat = 0
        
        collectionView.backgroundColor = Global.colorBg
        collectionView.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.indicatorStyle = .white
        collectionView.contentInset = UIEdgeInsetsMake(p, 0, p, p)
        collectionView.showsHorizontalScrollIndicator = false
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(p, 0, p, p)
        layout.minimumLineSpacing = p
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
  
        newLoanRequestButton.setTitle("NEW LOAN REQUEST", for: .normal)
        newLoanRequestButton.backgroundColor = UIColor.white
        newLoanRequestButton.setTitleColor(UIColor.black, for: .normal)
        newLoanRequestButton.setTitleColor(Global.colorMain, for: .highlighted)
        newLoanRequestButton.layer.cornerRadius = 5
        newLoanRequestButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        newLoanRequestButton.clipsToBounds = true
        
        applyForLoanButton.setTitle("APPLY FOR LOAN", for: .normal)
        applyForLoanButton.backgroundColor = UIColor.white
        applyForLoanButton.setTitleColor(UIColor.black, for: .normal)
        applyForLoanButton.setTitleColor(Global.colorMain, for: .highlighted)
        applyForLoanButton.layer.cornerRadius = 5
        applyForLoanButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        applyForLoanButton.clipsToBounds = true
        
        orLabel.text = "OR"
        orLabel.font = UIFont(name: "OpenSans-bold", size: 15)
        orLabel.textAlignment = .center
        orLabel.textColor = UIColor.white
        
        leftLine.backgroundColor = UIColor.white
        rightLine.backgroundColor = UIColor.white
        
        newUserButton.setTitle("NEW USER? REGISTER", for: .normal)
        newUserButton.backgroundColor = Global.colorNewUser
        newUserButton.setTitleColor(UIColor.white, for: .normal)
        newUserButton.setTitleColor(Global.colorMain, for: .highlighted)
        newUserButton.layer.cornerRadius = 5
        newUserButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        newUserButton.clipsToBounds = true
        
        alreadyHaveAccountLabel.text = "Already have an account?"
        alreadyHaveAccountLabel.font = UIFont(name: "OpenSans-bold", size: 17)
        alreadyHaveAccountLabel.textAlignment = .center
        alreadyHaveAccountLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        
        signInButton.setTitle("LOGIN", for: .normal)
        signInButton.backgroundColor = Global.colorLogin
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.setTitleColor(Global.colorMain, for: .highlighted)
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        signInButton.clipsToBounds = true

        contactUsButton.setTitle("CONTACT US", for: .normal)
        contactUsButton.backgroundColor = Global.colorMain.withAlphaComponent(0.7)
        contactUsButton.setTitleColor(UIColor.white, for: .normal)
        contactUsButton.setTitleColor(Global.colorMain, for: .highlighted)
        contactUsButton.layer.cornerRadius = 5
        contactUsButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        contactUsButton.clipsToBounds = true
        
        containerView.addSubview(collectionView)
        containerView.addSubview(pageControl)
//        containerView.addSubview(iconImgView)
        containerView.addSubview(newLoanRequestButton)
        containerView.addSubview(applyForLoanButton)
        containerView.addSubview(leftLine)
        containerView.addSubview(orLabel)
        containerView.addSubview(rightLine)
        containerView.addSubview(newUserButton)
        containerView.addSubview(alreadyHaveAccountLabel)
        containerView.addSubview(signInButton)
        containerView.addSubview(contactUsButton)

        scrollView.addSubview(containerView)
        addSubview(scrollView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            scrollView.autoPinEdgesToSuperviewEdges()
            
            containerView.autoPinEdgesToSuperviewEdges()
            containerView.autoMatch(.width, to: .width, of: self)
            
            let alpha: CGFloat = 50
            
            collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            collectionView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            collectionView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            collectionView.autoSetDimension(.height, toSize: 220)
            
            pageControl.autoPinEdge(toSuperviewEdge: .top, withInset: 200)
            pageControl.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
            pageControl.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            pageControl.autoSetDimension(.height, toSize: 20)
            
//            iconImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
//            iconImgView.autoSetDimensions(to: CGSize(width: 192, height: 192))
//            iconImgView.autoAlignAxis(toSuperviewAxis: .vertical)
            
            newLoanRequestButton.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 20)
            newLoanRequestButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            newLoanRequestButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            newLoanRequestButton.autoSetDimension(.height, toSize: 45)
            
            applyForLoanButton.autoPinEdge(.top, to: .bottom, of: newLoanRequestButton, withOffset: 10)
            applyForLoanButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            applyForLoanButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            applyForLoanButton.autoSetDimension(.height, toSize: 45)
            
            orLabel.autoPinEdge(.top, to: .bottom, of: applyForLoanButton, withOffset: 20)
            orLabel.autoSetDimensions(to: CGSize(width: 60, height: 30))
            orLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            
            leftLine.autoPinEdge(.right, to: .left, of: orLabel, withOffset: 0)
            leftLine.autoPinEdge(toSuperviewEdge: .left, withInset: alpha - 20)
            leftLine.autoAlignAxis(.horizontal, toSameAxisOf: orLabel)
            leftLine.autoSetDimension(.height, toSize: 1)
            
            rightLine.autoPinEdge(.left, to: .right, of: orLabel, withOffset: 0)
            rightLine.autoPinEdge(toSuperviewEdge: .right, withInset: alpha - 20)
            rightLine.autoAlignAxis(.horizontal, toSameAxisOf: orLabel)
            rightLine.autoSetDimension(.height, toSize: 1)
            
            newUserButton.autoPinEdge(.top, to: .bottom, of: orLabel, withOffset: 15)
            newUserButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            newUserButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            newUserButton.autoSetDimension(.height, toSize: 45)
            
            alreadyHaveAccountLabel.autoPinEdge(.top, to: .bottom, of: newUserButton, withOffset: 15)
            alreadyHaveAccountLabel.autoSetDimension(.height, toSize: 30)
            alreadyHaveAccountLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            
            signInButton.autoPinEdge(.top, to: .bottom, of: alreadyHaveAccountLabel, withOffset: 15)
            signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            signInButton.autoSetDimension(.height, toSize: 45)
            
            contactUsButton.autoPinEdge(.top, to: .bottom, of: signInButton, withOffset: 20)
            contactUsButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            contactUsButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            contactUsButton.autoSetDimension(.height, toSize: 45)
        }
    }
}

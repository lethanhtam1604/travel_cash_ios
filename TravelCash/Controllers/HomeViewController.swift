//
//  HomeViewController.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/14/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    var menus = [Menu]()
    var promotions = [Promotion]()
    var currentSlide:Int = 0
    
    override func loadView() {
        view = homeView
        view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = Global.colorNavBar
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "OpenSans-semibold", size: 15)!]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        
        homeView.newLoanRequestButton.addTarget(self, action: #selector(actionTapToNewLoanRequestButton), for: .touchUpInside)
        homeView.applyForLoanButton.addTarget(self, action: #selector(actionTapToApplyForLoanButton), for: .touchUpInside)
        homeView.newUserButton.addTarget(self, action: #selector(actionTapToNewUserButton), for: .touchUpInside)
        homeView.signInButton.addTarget(self, action: #selector(actionTapToSignInButton), for: .touchUpInside)
        homeView.contactUsButton.addTarget(self, action: #selector(actionTapToContactUsButton), for: .touchUpInside)
        
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
        loadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height: CGFloat = 10 + 20 + 20 + 10 + 20 + 15 + 15 + 20 + 192 + 45 + 45 + 30 + 45 + 30 + 45 + 45 + 10
        
        homeView.containerView.autoSetDimension(.height, toSize: height)
        homeView.scrollView.contentSize = homeView.containerView.bounds.size
    }
    
    func loadData() {
        
        ApiManager.shared.getPromotions(user_id: "-1") { (promotions, status, message) in
            if let promotionList = promotions {
                self.promotions = promotionList
                self.homeView.collectionView.reloadData()
                self.homeView.pageControl.numberOfPages = self.promotions.count
            }
        }
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runSliderInLoop), userInfo: nil, repeats: true)
    }
    
    func runSliderInLoop() {
        if promotions.count != 0 {
            if currentSlide == promotions.count - 1 {
                currentSlide = 0
            } else {
                currentSlide += 1
            }
            
            homeView.collectionView.scrollToItem(at: IndexPath(row: currentSlide, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            homeView.pageControl.currentPage = Int(currentSlide)
        }
    }
    
    func actionTapToNewLoanRequestButton() {
        let viewController = NewLoanRequestViewController()
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true, completion: nil)
    }
    
    func actionTapToApplyForLoanButton() {
        let viewController = PersonalInfoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func actionTapToNewUserButton() {
        let viewController = RegisterViewController()
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true, completion: nil)
    }
    
    func actionTapToSignInButton() {
        let viewController = LoginViewController()
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true, completion: nil)
    }
    
    func actionTapToContactUsButton() {
        let viewController = OurLocationViewController()
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PromotionCollectionViewCell
        
        cell.bindingData(promotion: promotions[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(homeView.collectionView.contentOffset.x / homeView.collectionView.frame.size.width)
        homeView.pageControl.currentPage = Int(pageNumber)
        currentSlide = Int(pageNumber)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

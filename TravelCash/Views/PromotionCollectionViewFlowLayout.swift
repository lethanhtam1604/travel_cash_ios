//
//  PromotionCollectionViewFlowLayout.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit

class PromotionCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let x = collectionView?.contentOffset.x else {
            return CGPoint(x: 0, y: 0)
        }
        let currentPage = x / pageWidth()
        if fabs(velocity.x) > 0.2 {
            let nextPage: CGFloat = CGFloat((velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage))
            return CGPoint(x: CGFloat((nextPage * pageWidth())), y: CGFloat(proposedContentOffset.y))
        } else {
            return CGPoint(x: CGFloat((round(currentPage) * pageWidth())), y: CGFloat(proposedContentOffset.y))
        }
    }
    
    func pageWidth() -> CGFloat {
        return itemSize.width + minimumLineSpacing
    }
}

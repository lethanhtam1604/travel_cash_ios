//
//  AttachmentView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/19/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class AttachmentView: UIView {
    
    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let titleLabel = UILabel()
    let numberPageLabel = UILabel()
    
    let errorLabel = UILabel()
    
    let documentFirstField = UITextField()
    let documentFirstBorder = UIView()
    let documentFirstView = UIView()
    
    let documentSecondField = UITextField()
    let documentSecondBorder = UIView()
    let documentSecondView = UIView()
    
    let documentThirdField = UITextField()
    let documentThirdBorder = UIView()
    let documentThirdView = UIView()
    
    let documentFourthField = UITextField()
    let documentFourthBorder = UIView()
    let documentFourthView = UIView()
    
    let documentFifthField = UITextField()
    let documentFifthBorder = UIView()
    let documentFifthView = UIView()
    
    var currentDocument: UITextField!
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        titleLabel.text = "Attachments"
        titleLabel.font = UIFont(name: "OpenSans", size: 24)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Global.colorMidBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        numberPageLabel.text = "6/7"
        numberPageLabel.font = UIFont(name: "OpenSans", size: 17)
        numberPageLabel.textAlignment = .center
        numberPageLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        numberPageLabel.lineBreakMode = .byWordWrapping
        numberPageLabel.numberOfLines = 0
        numberPageLabel.layer.cornerRadius = 15
        numberPageLabel.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        documentFirstField.textAlignment = .left
        documentFirstField.placeholder = "Document 1"
        documentFirstField.textColor = UIColor.black
        documentFirstField.inputAccessoryView = UIView()
        documentFirstField.font = UIFont(name: "OpenSans", size: 17)
        documentFirstBorder.backgroundColor = Global.colorSeparator
        documentFirstField.addSubview(documentFirstBorder)
        documentFirstField.addSubview(documentFirstView)
        
        documentSecondField.textAlignment = .left
        documentSecondField.placeholder = "Document 2"
        documentSecondField.textColor = UIColor.black
        documentSecondField.inputAccessoryView = UIView()
        documentSecondField.font = UIFont(name: "OpenSans", size: 17)
        documentSecondBorder.backgroundColor = Global.colorSeparator
        documentSecondField.addSubview(documentSecondBorder)
        documentSecondField.addSubview(documentSecondView)
        
        documentThirdField.textAlignment = .left
        documentThirdField.placeholder = "Document 3"
        documentThirdField.textColor = UIColor.black
        documentThirdField.inputAccessoryView = UIView()
        documentThirdField.font = UIFont(name: "OpenSans", size: 17)
        documentThirdBorder.backgroundColor = Global.colorSeparator
        documentThirdField.addSubview(documentThirdBorder)
        documentThirdField.addSubview(documentThirdView)
        
        documentFourthField.textAlignment = .left
        documentFourthField.placeholder = "Document 4"
        documentFourthField.textColor = UIColor.black
        documentFourthField.inputAccessoryView = UIView()
        documentFourthField.font = UIFont(name: "OpenSans", size: 17)
        documentFourthBorder.backgroundColor = Global.colorSeparator
        documentFourthField.addSubview(documentFourthBorder)
        documentFourthField.addSubview(documentFourthView)
        
        documentFifthField.textAlignment = .left
        documentFifthField.placeholder = "Document 5"
        documentFifthField.textColor = UIColor.black
        documentFifthField.inputAccessoryView = UIView()
        documentFifthField.font = UIFont(name: "OpenSans", size: 17)
        documentFifthBorder.backgroundColor = Global.colorSeparator
        documentFifthField.addSubview(documentFifthBorder)
        documentFifthField.addSubview(documentFifthView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(numberPageLabel)
        containerView.addSubview(errorLabel)
        containerView.addSubview(documentFirstField)
        containerView.addSubview(documentSecondField)
        containerView.addSubview(documentThirdField)
        containerView.addSubview(documentFourthField)
        containerView.addSubview(documentFifthField)
        
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

            let alpha: CGFloat = 40
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(.right, to: .left, of: numberPageLabel, withOffset: 10)
            
            numberPageLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            numberPageLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            numberPageLabel.autoSetDimensions(to: CGSize(width: 50, height: 30))
            
            errorLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            documentFirstField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            documentFirstField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFirstField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFirstField.autoSetDimension(.height, toSize: 40)
            
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFirstBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFirstBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFirstView.autoPinEdgesToSuperviewEdges()
            
            documentSecondField.autoPinEdge(.top, to: .bottom, of: documentFirstField, withOffset: 20)
            documentSecondField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentSecondField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentSecondField.autoSetDimension(.height, toSize: 40)
            
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .left)
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .right)
            documentSecondBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentSecondBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentSecondView.autoPinEdgesToSuperviewEdges()
            
            documentThirdField.autoPinEdge(.top, to: .bottom, of: documentSecondField, withOffset: 20)
            documentThirdField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentThirdField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentThirdField.autoSetDimension(.height, toSize: 40)
            
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .left)
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .right)
            documentThirdBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentThirdBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentThirdView.autoPinEdgesToSuperviewEdges()
            
            documentFourthField.autoPinEdge(.top, to: .bottom, of: documentThirdField, withOffset: 20)
            documentFourthField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFourthField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFourthField.autoSetDimension(.height, toSize: 40)
            
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFourthBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFourthBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFourthView.autoPinEdgesToSuperviewEdges()
            
            documentFifthField.autoPinEdge(.top, to: .bottom, of: documentFourthField, withOffset: 20)
            documentFifthField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            documentFifthField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            documentFifthField.autoSetDimension(.height, toSize: 40)
            
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .left)
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .right)
            documentFifthBorder.autoPinEdge(toSuperviewEdge: .bottom)
            documentFifthBorder.autoSetDimension(.height, toSize: 0.7)
            
            documentFifthView.autoPinEdgesToSuperviewEdges()
        }
    }
}

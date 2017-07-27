//
//  UpdateUserInfoView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/15/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class UpdateUserInfoView: UIView {

    var constraintsAdded = false
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let errorLabel = UILabel()
    
    let addressFirstField = UITextField()
    let addressFirstBorder = UIView()
    
    let addressSecondField = UITextField()
    let addressSecondBorder = UIView()
    
    let parishField = UITextField()
    let parishBorder = UIView()
    let arrowDropDownView = UIView()
    let arrowDropDownImgView = UIImageView()
    let parishAbstract = UIView()
    let parishDropDown = DropDown()

    let dobField = UITextField()
    let dobBorder = UIView()
    let dateRangeView = UIView()
    let dateRangeImgView = UIImageView()
    let dobAbstract = UIView()
    
    let submitButton = UIButton()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = true
        
        errorLabel.font = UIFont(name: "OpenSans", size: 14)
        errorLabel.textAlignment = .center
        errorLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        errorLabel.adjustsFontSizeToFitWidth = true
        
        addressFirstField.textAlignment = .left
        addressFirstField.placeholder = "Address 1"
        addressFirstField.textColor = UIColor.black
        addressFirstField.returnKeyType = .next
        addressFirstField.keyboardType = .namePhonePad
        addressFirstField.inputAccessoryView = UIView()
        addressFirstField.autocorrectionType = .no
        addressFirstField.autocapitalizationType = .none
        addressFirstField.font = UIFont(name: "OpenSans", size: 17)
        addressFirstBorder.backgroundColor = Global.colorSeparator
        addressFirstField.addSubview(addressFirstBorder)
        
        addressSecondField.textAlignment = .left
        addressSecondField.placeholder = "Address 2"
        addressSecondField.textColor = UIColor.black
        addressSecondField.returnKeyType = .next
        addressSecondField.keyboardType = .namePhonePad
        addressSecondField.inputAccessoryView = UIView()
        addressSecondField.autocorrectionType = .no
        addressSecondField.autocapitalizationType = .none
        addressSecondField.font = UIFont(name: "OpenSans", size: 17)
        addressSecondBorder.backgroundColor = Global.colorSeparator
        addressSecondField.addSubview(addressSecondBorder)
        
        parishField.textAlignment = .left
        parishField.placeholder = "Parish"
        parishField.textColor = UIColor.black
        parishField.returnKeyType = .next
        parishField.keyboardType = .phonePad
        parishField.inputAccessoryView = UIView()
        parishField.autocorrectionType = .no
        parishField.autocapitalizationType = .none
        parishField.font = UIFont(name: "OpenSans", size: 17)
        parishBorder.backgroundColor = Global.colorSeparator
        parishField.addSubview(parishBorder)
        parishAbstract.backgroundColor = UIColor.clear
        arrowDropDownView.backgroundColor = UIColor.white
        arrowDropDownView.addSubview(arrowDropDownImgView)
        parishField.addSubview(arrowDropDownView)
        parishField.addSubview(parishAbstract)
        
        arrowDropDownImgView.clipsToBounds = true
        arrowDropDownImgView.contentMode = .scaleAspectFit
        arrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        parishDropDown.anchorView = parishBorder
        parishDropDown.direction = .bottom
        parishDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        parishDropDown.selectionAction = { [unowned self] (index, item) in
            self.parishField.text = item
        }
        
        dobField.textAlignment = .left
        dobField.placeholder = "Enter DOB"
        dobField.textColor = UIColor.black
        dobField.returnKeyType = .next
        dobField.keyboardType = .phonePad
        dobField.inputAccessoryView = UIView()
        dobField.autocorrectionType = .no
        dobField.autocapitalizationType = .none
        dobField.font = UIFont(name: "OpenSans", size: 17)
        dobBorder.backgroundColor = Global.colorSeparator
        dobField.addSubview(dobBorder)
        dobAbstract.backgroundColor = UIColor.clear
        dateRangeView.backgroundColor = UIColor.white
        dateRangeView.addSubview(dateRangeImgView)
        dobField.addSubview(dateRangeView)
        dobField.addSubview(dobAbstract)
        
        dateRangeImgView.clipsToBounds = true
        dateRangeImgView.contentMode = .scaleAspectFit
        dateRangeImgView.image = UIImage(named: "ic_date_range")
        
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.backgroundColor = Global.colorNewUser
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.setTitleColor(Global.colorMain, for: .highlighted)
        submitButton.layer.cornerRadius = 5
        submitButton.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        submitButton.clipsToBounds = true
        
        containerView.addSubview(errorLabel)
        containerView.addSubview(addressFirstField)
        containerView.addSubview(addressSecondField)
        containerView.addSubview(parishField)
        containerView.addSubview(dobField)
        containerView.addSubview(submitButton)
        
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
            
            errorLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            errorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            errorLabel.autoSetDimension(.height, toSize: 20)
            
            addressFirstField.autoPinEdge(.top, to: .bottom, of: errorLabel, withOffset: 10)
            addressFirstField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            addressFirstField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            addressFirstField.autoSetDimension(.height, toSize: 40)
            
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .left)
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .right)
            addressFirstBorder.autoPinEdge(toSuperviewEdge: .bottom)
            addressFirstBorder.autoSetDimension(.height, toSize: 0.7)
            
            addressSecondField.autoPinEdge(.top, to: .bottom, of: addressFirstField, withOffset: 20)
            addressSecondField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            addressSecondField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            addressSecondField.autoSetDimension(.height, toSize: 40)
            
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .left)
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .right)
            addressSecondBorder.autoPinEdge(toSuperviewEdge: .bottom)
            addressSecondBorder.autoSetDimension(.height, toSize: 0.7)
            
            parishField.autoPinEdge(.top, to: .bottom, of: addressSecondField, withOffset: 20)
            parishField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            parishField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            parishField.autoSetDimension(.height, toSize: 40)
            
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            arrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            arrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            arrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            arrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            arrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            parishAbstract.autoPinEdgesToSuperviewEdges()
            
            parishBorder.autoPinEdge(toSuperviewEdge: .left)
            parishBorder.autoPinEdge(toSuperviewEdge: .right)
            parishBorder.autoPinEdge(toSuperviewEdge: .bottom)
            parishBorder.autoSetDimension(.height, toSize: 0.7)
            
            dobField.autoPinEdge(.top, to: .bottom, of: parishField, withOffset: 20)
            dobField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            dobField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            dobField.autoSetDimension(.height, toSize: 40)
            
            dateRangeView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            dateRangeView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            dateRangeView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            dateRangeView.autoSetDimension(.width, toSize: 25)
            
            dateRangeImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            dateRangeImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            dateRangeImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            dobAbstract.autoPinEdgesToSuperviewEdges()
            
            dobBorder.autoPinEdge(toSuperviewEdge: .left)
            dobBorder.autoPinEdge(toSuperviewEdge: .right)
            dobBorder.autoPinEdge(toSuperviewEdge: .bottom)
            dobBorder.autoSetDimension(.height, toSize: 0.7)
            
            
            submitButton.autoPinEdge(.top, to: .bottom, of: dobField, withOffset: 30)
            submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: alpha + 10)
            submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: alpha + 10)
            submitButton.autoSetDimension(.height, toSize: 45)
        }
    }
}

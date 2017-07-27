//
//  MakeRequestView.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/21/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import DropDown

class MakeRequestView: UIView {

    var constraintsAdded = false
    
    let titleLabel = UILabel()
    
    let requestTypeField = UITextField()
    let requestTypeBorder = UIView()
    let requestTypeArrowDropDownView = UIView()
    let requestTypeArrowDropDownImgView = UIImageView()
    let requestTypeAbstract = UIView()
    let requestTypeDropDown = DropDown()
    
    let cancelBtn = UIButton()
    let sendBtn = UIButton()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.white
        tintColor = Global.colorMain
        addTapToDismiss()
      
        
        titleLabel.text = "Select your request type from the list below."
        titleLabel.font = UIFont(name: "OpenSans", size: 16)
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        requestTypeArrowDropDownView.backgroundColor = UIColor.white
        requestTypeArrowDropDownView.addSubview(requestTypeArrowDropDownImgView)
        
        requestTypeArrowDropDownImgView.clipsToBounds = true
        requestTypeArrowDropDownImgView.contentMode = .scaleAspectFit
        requestTypeArrowDropDownImgView.image = UIImage(named: "ic_arrow_drop_down")
        
        requestTypeField.textAlignment = .left
        requestTypeField.placeholder = "Request Types"
        requestTypeField.textColor = UIColor.black
        requestTypeField.returnKeyType = .next
        requestTypeField.keyboardType = .phonePad
        requestTypeField.inputAccessoryView = UIView()
        requestTypeField.autocorrectionType = .no
        requestTypeField.autocapitalizationType = .none
        requestTypeField.font = UIFont(name: "OpenSans", size: 17)
        requestTypeBorder.backgroundColor = Global.colorSeparator
        requestTypeField.addSubview(requestTypeBorder)
        requestTypeAbstract.backgroundColor = UIColor.clear
        requestTypeField.addSubview(requestTypeArrowDropDownView)
        requestTypeField.addSubview(requestTypeAbstract)
        
        requestTypeDropDown.anchorView = requestTypeField
        requestTypeDropDown.direction = .bottom
        requestTypeDropDown.bottomOffset = CGPoint(x: 0, y: 1)
        requestTypeDropDown.selectionAction = { [unowned self] (index, item) in
            self.requestTypeField.text = item
        }
        
        cancelBtn.setTitle("CANCEL", for: .normal)
        cancelBtn.backgroundColor = Global.colorMidBlue
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        cancelBtn.clipsToBounds = true
        cancelBtn.titleLabel?.lineBreakMode = .byWordWrapping
        cancelBtn.titleLabel?.textAlignment = .center
        
        sendBtn.setTitle("SEND", for: .normal)
        sendBtn.backgroundColor = Global.colorMidBlue
        sendBtn.setTitleColor(UIColor.white, for: .normal)
        sendBtn.setTitleColor(Global.colorSelected, for: .highlighted)
        sendBtn.layer.cornerRadius = 5
        sendBtn.titleLabel?.font = UIFont(name: "OpenSans-semibold", size: 15)
        sendBtn.clipsToBounds = true
        sendBtn.titleLabel?.lineBreakMode = .byWordWrapping
        sendBtn.titleLabel?.textAlignment = .center

        addSubview(titleLabel)
        addSubview(requestTypeField)
        addSubview(sendBtn)
        addSubview(cancelBtn)

        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        if !constraintsAdded {
            constraintsAdded = true
            
            let alpha: CGFloat = 40
            
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            
            requestTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
            requestTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            requestTypeArrowDropDownView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 1)
            requestTypeArrowDropDownView.autoSetDimension(.width, toSize: 25)
            
            requestTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .top, withInset: 12)
            requestTypeArrowDropDownImgView.autoPinEdge(toSuperviewEdge: .right, withInset: 1)
            requestTypeArrowDropDownImgView.autoSetDimensions(to: CGSize(width: 25, height: 25))
            
            requestTypeField.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
            requestTypeField.autoPinEdge(toSuperviewEdge: .left, withInset: alpha)
            requestTypeField.autoPinEdge(toSuperviewEdge: .right, withInset: alpha)
            requestTypeField.autoSetDimension(.height, toSize: 40)
            
            requestTypeAbstract.autoPinEdgesToSuperviewEdges()
            
            requestTypeBorder.autoPinEdge(toSuperviewEdge: .left)
            requestTypeBorder.autoPinEdge(toSuperviewEdge: .right)
            requestTypeBorder.autoPinEdge(toSuperviewEdge: .bottom)
            requestTypeBorder.autoSetDimension(.height, toSize: 0.7)
            
            sendBtn.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            sendBtn.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            sendBtn.autoSetDimensions(to: CGSize(width: 80, height: 30))
            
            cancelBtn.autoPinEdge(.bottom, to: .bottom, of: sendBtn)
            cancelBtn.autoMatch(.height, to: .height, of: sendBtn)
            cancelBtn.autoMatch(.width, to: .width, of: sendBtn)
            cancelBtn.autoPinEdge(.right, to: .left, of: sendBtn, withOffset: -10)
        }
    }
}

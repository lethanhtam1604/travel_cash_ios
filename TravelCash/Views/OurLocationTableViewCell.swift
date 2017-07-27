//
//  OurLocationTableViewCell.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/20/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import FontAwesomeKit
import FRHyperLabel
import ActiveLabel

class OurLocationTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let imagesLabel = UILabel()

    var phonesView = [UIView]()

    var constraintAdded = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.white
        
        nameLabel.text = "Kingston"
        nameLabel.font = UIFont(name: "OpenSans-bold", size: 16)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 0
        
        addressLabel.text = "312 Lo Sieu Street, 13 Ward, District 11, Ho Chi Minh City"
        addressLabel.font = UIFont(name: "OpenSans", size: 15)
        addressLabel.textAlignment = .left
        addressLabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        addressLabel.lineBreakMode = .byWordWrapping
        addressLabel.numberOfLines = 0

        imagesLabel.font = UIFont(name: "OpenSans", size: 10)
        imagesLabel.textAlignment = .left
        imagesLabel.textColor = Global.colorMidBlue
        imagesLabel.lineBreakMode = .byWordWrapping
        imagesLabel.numberOfLines = 0

        addSubview(nameLabel)
        addSubview(addressLabel)
        addSubview(imagesLabel)

        setNeedsUpdateConstraints()
    }

    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans", size: 15)
        label.textAlignment = .center
        label.textColor = Global.colorMidBlue
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0


        let textRange = NSMakeRange(0, text.length())
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSUnderlineStyleAttributeName, value:NSUnderlineStyle.styleSingle.rawValue, range: textRange)

        label.attributedText = attributedText

        let tap = UITapGestureRecognizer(target: self, action: #selector(actionTapToPhoneNumber))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)

        return label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !constraintAdded {
            constraintAdded = true
            
            nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
            
            addressLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 0)
            addressLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
            addressLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)

            imagesLabel.autoPinEdge(.top, to: .bottom, of: addressLabel, withOffset: 10)
            imagesLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            imagesLabel.autoSetDimension(.width, toSize: 20)

        }
    }
    
    func bindingData(location: Location) {
        nameLabel.text = location.Community
        addressLabel.text = location.Location

        let attributes: [String : Any] = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .headline)]

        let phoneString = NSMutableAttributedString()


        let imagePhone = UIImage(named: "ic_phone_iphone")
        let imagePhoneAttachment = NSTextAttachment()
        imagePhoneAttachment.image = imagePhone
        imagePhoneAttachment.bounds.origin = CGPoint(x: 0, y: -5)
        imagePhoneAttachment.bounds.size = (imagePhone?.size)!
        
        let iosPrinterIcon = FAKIonIcons.printerIcon(withSize: 25)
        iosPrinterIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.black)
        let iosPrinterImg = iosPrinterIcon?.image(with: CGSize(width: 25, height: 25))
        let imageFaxAttachment = NSTextAttachment()
        imageFaxAttachment.image = iosPrinterImg
        imageFaxAttachment.bounds.origin = CGPoint(x: 0, y: -5)
        imageFaxAttachment.bounds.size = (iosPrinterImg?.size)!

        let imagePhoneString = NSAttributedString(attachment: imagePhoneAttachment)
        let imageFaxString = NSAttributedString(attachment: imageFaxAttachment)


        for view in phonesView {
            view.removeFromSuperview()
        }

        phonesView = [UIView]()

        var height: CGFloat = 10

        for item in location.phones {
            phoneString.append(imagePhoneString)
            phoneString.append(NSAttributedString(string: "\n", attributes: attributes))

            phonesView.append(createLabel(text: item))
        }

        for item in location.faxes {
            phoneString.append(imageFaxString)
            phoneString.append(NSAttributedString(string: "\n", attributes: attributes))

            phonesView.append(createLabel(text: item))
        }

        for view in phonesView {
            addSubview(view)

            view.autoPinEdge(.top, to: .bottom, of: addressLabel, withOffset: height)
            view.autoPinEdge(.left, to: .right, of: imagesLabel, withOffset: 5)

            height += 25
        }

        imagesLabel.attributedText = phoneString
    }

    func actionTapToPhoneNumber(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            if let text = (sender.view as? UILabel)?.text {
                let phones = text.components(separatedBy: "-")

                var string = ""
                for item in phones {
                    string += item
                }
                callNumber(phone: string)
            }
        }
    }

    func callNumber(phone: String) {
        let components = phone.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let decimalString = components.joined(separator: "")

        let phone = "tel://" + decimalString
        let url:NSURL = NSURL(string:phone)!
        UIApplication.shared.openURL(url as URL)
    }
}

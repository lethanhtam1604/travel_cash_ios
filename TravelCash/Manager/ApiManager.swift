//
//  ApiManager.swift
//  TravelCash
//
//  Created by Thanh-Tam Le on 6/26/17.
//  Copyright © 2017 Tam. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ApiManager: NSObject {

    static let shared = ApiManager()

    func register(user: User, completion: @escaping (_ user : User?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["email": user.email, "pass": user.pass, "phone_number": user.phone_number, "trn": user.trn, "first_name": user.first_name, "surname": user.surname] as [String : Any]

        Alamofire.request(Global.baseUrl + "registerUserFull", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseObject { (response: DataResponse<UserResponse>) in
            switch response.result {
            case .success(_):
                let userResponse = response.result.value
                if userResponse?.status == "success" {
                    completion(userResponse?.user, true, "")
                }
                else {
                    completion(nil, false, userResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func login(trn: String, password: String, completion: @escaping (_ user : User?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + trn + "\", \"pass\" : \"" + password + "\"}"]

        Alamofire.request(Global.baseUrl + "loginUser", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
            switch response.result {
            case .success(_):
                let userResponse = response.result.value
                if userResponse?.user != nil {
                    completion(userResponse?.user, true, "")
                }
                else {
                    completion(nil, false, userResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getUserProfile(trn: String, completion: @escaping (_ user : User?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + trn + "\"}"]

        Alamofire.request(Global.baseUrl + "refreshUser", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
            switch response.result {
            case .success(_):
                let userResponse = response.result.value
                if userResponse?.status == "success" {
                    completion(userResponse?.user, true, "")
                }
                else {
                    completion(nil, false, userResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func updateUserProfile(user: User, completion: @escaping (_ user : User?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + user.trn + "\", \"user_id\" : " + user.user_id + ", \"address_1\" : \"" + user.address_1 + "\", \"address_2\" : \"" + user.address_2 + "\", \"parish\" : \"" + user.parish + "\", \"dob\" : \"" + user.dob + "\"}"]

        Alamofire.request(Global.baseUrl + "updateUserProfile", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
            switch response.result {
            case .success(_):
                let userResponse = response.result.value
                if userResponse?.user != nil {
                    completion(userResponse?.user, true, "")
                }
                else {
                    completion(nil, false, userResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getNotificationList(trn: String, completion: @escaping (_ notifications : [Notification]?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + trn + "\"}"]

        Alamofire.request(Global.baseUrl + "notificationsByTrn", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<NotificationResponse>) in
            switch response.result {
            case .success(_):
                let notificaitonResponse = response.result.value
                if notificaitonResponse?.status == "success" {
                    completion(notificaitonResponse?.notifications, true, "")
                }
                else {
                    completion(nil, false, notificaitonResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getBranches(completion: @escaping (_ locations : [Location]?, _ success: Bool, _ message: String?) -> Void) {

        Alamofire.request(Global.baseUrl + "getBranches", method: .get, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<LocationResponse>) in
            switch response.result {
            case .success(_):
                let locationResponse = response.result.value
                if locationResponse?.status == "success" {

                    for item in (locationResponse?.branches)! {

                        if item.PhoneNo.range(of:"; ") != nil {
                            let phones = item.PhoneNo.components(separatedBy: "; ")
                            for phone in phones {
                                item.phones.append(phone)
                            }
                        }
                        else if item.PhoneNo.range(of:", ") != nil {
                            let phones = item.PhoneNo.components(separatedBy: ", ")
                            for phone in phones {
                                item.phones.append(phone)
                            }
                        }
                        else {
                            item.phones.append(item.PhoneNo)
                        }

                        if item.FaxNo.range(of:"; ") != nil {
                            let faxes = item.FaxNo.components(separatedBy: "; ")
                            for fax in faxes {
                                item.faxes.append(fax + "1")
                            }
                        }
                        else if item.FaxNo.range(of:", ") != nil {
                            let faxes = item.FaxNo.components(separatedBy: ", ")
                            for fax in faxes {
                                item.faxes.append(fax + "1")
                            }
                        }
                        else {
                            item.faxes.append(item.FaxNo + "1")
                        }

                    }
                    completion(locationResponse?.branches, true, "")
                }
                else {
                    completion(nil, false, locationResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func newLoanRequest(newLoanRequest: NewLoanRequest, completion: @escaping (_ loanRequestResponse : LoanRequestResponse?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + newLoanRequest.trn + "\", \"first_name\" : \"" + newLoanRequest.first_name + "\", \"surname\" : \"" + newLoanRequest.surname + "\", \"phone_number\" : \"" + newLoanRequest.phone_number + "\", \"address_1\" : \"" + newLoanRequest.address_1 + "\", \"address_2\" : \"" + newLoanRequest.address_2 + "\", \"parish\" : \"" + newLoanRequest.parish + "\", \"request_amount\" : \"" + String(newLoanRequest.requestAmount) + "\", \"canceled\" : 0, \"email\" : \"" + newLoanRequest.email  + "\"}"]

        Alamofire.request(Global.baseUrl + "addLoanRequest", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<LoanRequestResponse>) in
            switch response.result {
            case .success(_):
                let loanRequestResponse = response.result.value
                if loanRequestResponse?.status == "success" {
                    completion(loanRequestResponse, true, "")
                }
                else {
                    completion(nil, false, loanRequestResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func submitLoanApplication(newLoanApp: NewLoanApp, completion: @escaping (_ loanRequestResponse : LoanRequestResponse?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + newLoanApp.personalInfo.trn + "\", \"firstname\" : \"" + newLoanApp.personalInfo.first_name + "\", \"surname\" : \"" + newLoanApp.personalInfo.surname + "\", \"phone\" : \"" + newLoanApp.personalInfo.phone_number + "\", \"address1\" : \"" + newLoanApp.personalInfo.address_1 + "\", \"address2\" : \"" + newLoanApp.personalInfo.address_2 + "\", \"parish\" : \"" + newLoanApp.personalInfo.parish + "\", \"gender\" : \"" + newLoanApp.personalInfo.gender + "\", \"email\" : \"" + newLoanApp.personalInfo.email + "\", \"idtype\" : \"" + newLoanApp.personalInfo.idType + "\", \"idnumber\" : \"" + newLoanApp.personalInfo.idNumber + "\", \"nodependents\" : " + newLoanApp.personalInfo.numberOfDependents + ", \"homestatus\" : \"" + newLoanApp.personalInfo.homeStatus + "\", \"dob\" : \"" + newLoanApp.personalInfo.dob + "\", \"bank_name\" : \"" + newLoanApp.bankingInfo.bankName + "\", \"bank_branch\" : \"" + newLoanApp.bankingInfo.branch + "\", \"bank_accounttype\" : \"" + newLoanApp.bankingInfo.accountType + "\", \"employer\" : \"" + newLoanApp.workingInfo.employer + "\", \"employer_address1\" : \"" + newLoanApp.workingInfo.employerAddress_1 + "\", \"employer_address2\" : \"" + newLoanApp.workingInfo.employerAddress_2 + "\", \"employer_parish\" : \"" + newLoanApp.workingInfo.employerParish + "\", \"employer_phone\" : \"" + newLoanApp.workingInfo.employerPhone + "\", \"employment_years\" : \"" + newLoanApp.workingInfo.employerYears + "\", \"employment_months\" : \"" + newLoanApp.workingInfo.employerMonths + "\", \"employer_occupation\" : \"" + newLoanApp.workingInfo.employerOccupation + "\", \"employer_net_income\" : \"" + newLoanApp.workingInfo.employerNetIncome + "\", \"employer_salary_cycle\" : \"" + newLoanApp.workingInfo.employerSalaryCycle + "\", \"ref_fullname\" : \"" + newLoanApp.referenceInfo.refFullName + "\", \"ref_phone\" : \"" + newLoanApp.referenceInfo.refPhone + "\", \"ref_address1\" : \"" + newLoanApp.referenceInfo.refAddress_1 + "\", \"ref_address2\" : \"" + newLoanApp.referenceInfo.refAddress_2 + "\", \"ref_parish\" : \"" + newLoanApp.referenceInfo.refParish + "\", \"ref_relation\" : \"" + newLoanApp.referenceInfo.refRelationship + "\", \"kin_fullname\" : \"" + newLoanApp.skin.skinFullName + "\", \"kin_phone\" : \"" + newLoanApp.skin.skinPhone + "\", \"kin_address1\" : \"" + newLoanApp.skin.skinAddress_1 + "\", \"kin_address2\" : \"" + newLoanApp.skin.skinAddress_2 + "\", \"kin_parish\" : \"" + newLoanApp.skin.skinParish + "\", \"kin_relation\" : \"" + newLoanApp.skin.skinRelationship + "\", \"loanamount\" : \"" + newLoanApp.personalInfo.loanAmount + "\"}"]

        Alamofire.request(Global.baseUrl + "submitLoanApplication", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<LoanRequestResponse>) in
            switch response.result {
            case .success(_):
                let loanRequestResponse = response.result.value
                if loanRequestResponse?.status == "success" {
                    completion(loanRequestResponse, true, "")
                }
                else {
                    completion(nil, false, loanRequestResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getPromotions(user_id: String, completion: @escaping (_ promotions : [Promotion]?, _ success: Bool, _ message: String?) -> Void) {

        Alamofire.request(Global.baseUrl + "getPromotions/" + user_id, method: .get, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<PromotionResponse>) in
            switch response.result {
            case .success(_):
                let promotionResponse = response.result.value
                if promotionResponse?.status == "success" {
                    completion(promotionResponse?.promotions, true, "")
                }
                else {
                    completion(nil, false, promotionResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getUserLoan(trn: String, completion: @escaping (_ activeLoans : [ActiveLoan]?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"trn\" : \"" + trn + "\"}"]

        Alamofire.request(Global.baseUrl + "getUserLoan", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<ActiveLoanResponse>) in
            switch response.result {
            case .success(_):
                let activeLoanResponse = response.result.value
                if activeLoanResponse?.status == "success" {
                    completion(activeLoanResponse?.loans, true, "")
                }
                else {
                    completion(nil, false, activeLoanResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getLoanMiniStatement(loanId: String, completion: @escaping (_ statements : [Statement]?, _ success: Bool, _ message: String?) -> Void) {

        let parameters = ["loanId": loanId]

        Alamofire.request(Global.baseUrl + "getLoanMiniStatement", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<StatementResponse>) in
            switch response.result {
            case .success(_):
                let statementResponse = response.result.value
                if statementResponse?.status == "success" {
                    completion(statementResponse?.statements, true, "")
                }
                else {
                    completion(nil, false, statementResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func getRequestTypes(completion: @escaping (_ requestTypes : [RequestType]?, _ success: Bool, _ message: String?) -> Void) {

        Alamofire.request(Global.baseUrl + "getRequestTypes", method: .get, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<RequestTypeResponse>) in
            switch response.result {
            case .success(_):
                let requestTypeResponse = response.result.value
                if requestTypeResponse?.status == "success" {
                    completion(requestTypeResponse?.requestTypes, true, "")
                }
                else {
                    completion(nil, false, requestTypeResponse?.error)
                }
                break
            case .failure(_):
                completion(nil, false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func addUserRequest(trn: String, requestId: String, completion: @escaping (_ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"user_trn\" : \"" + trn + "\", \"request_type\" : \"" + requestId + "\", \"loanid\" : -1}"]

        Alamofire.request(Global.baseUrl + "addUserRequest", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<BaseResponse>) in
            switch response.result {
            case .success(_):
                let baseResponse = response.result.value
                if baseResponse?.status == "success" {
                    completion( true, "Make request successfully!")
                }
                else {
                    completion(false, baseResponse?.error)
                }
                break
            case .failure(_):
                completion(false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func sendFeedback(feedback: Feedback, completion: @escaping (_ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"first_name\" : \"" + feedback.firstName + "\", \"surname\" : \"" + feedback.surname + "\", \"phone_number\" : \"" + feedback.phoneNumber + "\", \"feedback\" : \"" + feedback.feedback  + "\"}"]

        Alamofire.request(Global.baseUrl + "sendFeedback", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<BaseResponse>) in
            switch response.result {
            case .success(_):
                let baseResponse = response.result.value
                completion(true, baseResponse?.status)
                break
            case .failure(_):
                completion(false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func setPromotionView(type: String, promotionId: String, userId: String, completion: @escaping (_ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"type\" : \"" + type + "\", \"promotionId\" : \"" + promotionId + "\", \"userId\" : \"" + userId + "\"}"]

        Alamofire.request(Global.baseUrl + "setPromotionView", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<BaseResponse>) in
            switch response.result {
            case .success(_):
                let baseResponse = response.result.value
                if baseResponse?.status == "success" {
                    completion(true, baseResponse?.status)
                }
                else {
                    completion(false, baseResponse?.error)
                }
                break
            case .failure(_):
                completion(false, "Could not connect to server. Please try again!")
                break
            }
        }
    }

    func uploadImage(loanRequestId: String, trn: String, document: Document) {
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(document.data!, withName: "file", fileName: document.fileName, mimeType: document.mimeType)
                multipartFormData.append(loanRequestId.data(using: .utf8)!, withName: "loanRequestId")
                multipartFormData.append(trn.data(using: .utf8)!, withName: "trn")
                multipartFormData.append(document.name.data(using: .utf8)!, withName: "name")

        }, to: "http://lmsweb.nichefinancingja.com/lms-api/addLoanRequest_files",
           method: .post,
           headers: nil,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseObject { (response: DataResponse<BaseResponse>) in
                    let baseResponse = response.result.value
                    print(baseResponse?.status ?? "")
                }
                return
            case .failure(_):
                return
            }
        })
    }

    func updateNotificationReadByTrn(notificaitonId: String, completion: @escaping (_ success: Bool, _ message: String?) -> Void) {

        let parameters = ["data": "{\"id\" :" + notificaitonId + "}"]

        Alamofire.request(Global.baseUrl + "updateNoticationReadByTrn", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<BaseResponse>) in
            switch response.result {
            case .success(_):
                let baseResponse = response.result.value
                if baseResponse?.status == "success" {
                    completion(true, "")
                }
                else {
                    completion(false, baseResponse?.error)
                }
                break
            case .failure(_):
                completion(false, "Could not connect to server. Please try again!")
                break
            }
        }
    }
}

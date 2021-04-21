//
//  PostAdNetworkManager.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import KRProgressHUD

class PostAdNetworkManager {
//    comment for checking
    
// comment for checking
    static let SharedInstance = PostAdNetworkManager()

    
    func request(url:String ,
                 method : Alamofire.HTTPMethod ,
                 parameters : [String : Any]? = nil ,
                 encoding : ParameterEncoding = JSONEncoding.default,
                 header : HTTPHeaders? = ["Authorization" : "Bearer \(defaults.token)","Content-Type" : "application/json"],
                 viewcontroller : UIViewController? = UIViewController(),
                 completionHandler :@escaping (AFDataResponse<Any>) -> Void
                 )  {
        
        #if DEBUG
        print("Method: \(method)")
        print("PATH: \(url)")
        print("Paramters: \(String(describing: parameters))")
        print("Encoding: \(encoding)")
        print("headers: \(String(describing: header))")
        #endif

        KRProgressHUD.show()
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: header).responseJSON { (response) in

            KRProgressHUD.dismiss()


            print("RESPONSE JSON: \(String(describing: response.result))")

            print("RESPONSE JSON: \(String(describing: response))")


            let json = JSON(response.result)
            do{
                let value = try response.result.get() as! [String : Any]
                let msg = value["message"] as? String
                let success = value["success"] as? Bool
                if !(success ?? true){
                    if let VC = viewcontroller {
                        VC.createAlert(title: "Alert!!", message: msg)
                    }
                }
            }catch{
                print("error")
            }
            

            if json["success"].intValue == -1 {

            }else{
                completionHandler(response)
            }

        }
    }
}

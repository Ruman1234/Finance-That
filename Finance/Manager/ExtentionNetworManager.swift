//
//  ExtentionNetworManager.swift
//  Jam with us
//
//  Created by Ammar Irfan on 01/07/2020.
//  Copyright © 2020 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

extension NetworkManager {
    
//    func DealerDetails(user_type:String,
//                       business_name:String,
//                       operating_name:String,
//                       street_address:String,
//                       city:String,
//                       province:String,
//                       postal_code:String,
//                       phone:String,
//                       fax:String,
//                       full_name:String,
//                       password:String,
//                       email:String,
//                       owner:String,
//                       years_in_business:String,
//                       no_of_owner:String,
//                       void_check_path:String,
//                       interior_business_path:String,
//                       exterior_business_path:String,
//                       license_path:String,
//                       utillityBillDoc:String,
//                       dealerAgreement:String,
//                       
//                       
//                       success : @escaping (DealerDetailModel) -> Void,
//                       failure : @escaping (NSError) -> Void)  {
//
//        self.request(url: Constants.BASE_URL  + Constants.DEALER_DETAIL, method: .post,parameters:["user_type" : user_type,"business_name": business_name,"operating_name": operating_name,"street_address": street_address,"city": city,"province": province,"postal_code": postal_code,"phone": phone,"fax": fax,"full_name": full_name,"password": password,"email": email,"owner": owner,"years_in_business": years_in_business,"no_of_owner": no_of_owner,"void_check_path": void_check_path,"interior_business_path": interior_business_path,"exterior_business_path": exterior_business_path,"license_path": license_path,"utillityBillDoc": utillityBillDoc,"dealerAgreement": dealerAgreement]) { (response) in
//
//            if response.response?.statusCode == 200 {
//                do{
//                    let value = try response.result.get()
//                    success(Mapper<DealerDetailModel>().map(JSON: value as! [String : Any])!)
//                }catch{
//                    failure(NSError())
//                }
//
//            }else{
//                failure(NSError())
//            }
//        }
//    }
    
    func BuyerDetail(full_name:String,
                     email:String,
                     password:String,
                     user_type:String,
                     viewcontroller : UIViewController = UIViewController(),
                     success : @escaping (BuyerDetailModel) -> Void,
                     failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.BUYER_DETAIL, method: .post,parameters:["full_name" : full_name,"email" : email,"password": password, "user_type": user_type],viewcontroller: viewcontroller) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<BuyerDetailModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    func imageIsNullOrNot(imageName : UIImage)-> Bool
    {

       let size = CGSize(width: 0, height: 0)
       if (imageName.size.width == size.width)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func DealerDetails(images : [imageData],
                  params : Parameters,
                  viewcontroller : UIViewController = UIViewController(),
                  
                  success : @escaping (String) -> Void,
                  failure : @escaping (NSError) -> Void)  {
        
        
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 400.0
        configuration.timeoutIntervalForResource = 400.0
        
        AF.upload(multipartFormData: { MultipartFormData in
            
            for img in images{
                if self.imageIsNullOrNot(imageName: img.image ?? UIImage()){
                    let image = img.image!.jpegData(compressionQuality: 0.5)!
                    MultipartFormData.append(image, withName: img.name , fileName: "\(img.name).jpeg" , mimeType: "image/jpeg")
                }
            }
            
            for (key, value) in params {
                MultipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            
        }, to: URL(string: Constants.BASE_URL  + Constants.DEALER_DETAIL)!, method: .post)
        .responseJSON { (response) in
            
            debugPrint("SUCCESS RESPONSE: \(response)")
            success("success")
        }
    }
    
    
    func Login(email:String,
               password:String,
               viewcontroller : UIViewController = UIViewController(),
               success : @escaping (LoginModel) -> Void,
               failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.LOGIN, method: .post,parameters:["email" : email, "password": password],encoding: JSONEncoding.default) { (response) in
//            success(Mapper<LoginModel>().map(JSON: response as! [String : Any])!)
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<LoginModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func ResetPassword(email:String,
                       viewcontroller : UIViewController = UIViewController(),
                       success : @escaping (ResetPasswordModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.EMAIL, method: .post,parameters:["email" : email,"code_type":"password_reset"]) { (response) in
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ResetPasswordModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func ResetComplete(password:String,
                       token:String,
                       viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (ResetCompleteModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.RESET_PASSWORD, method: .patch,parameters:["password" : password,"token": token]) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ResetCompleteModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func AdPriceListing(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (AdDetailsPriceListingModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.Price_Listing, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<AdDetailsPriceListingModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func AdLatitudeAndLongitude(latitude:String,
                                longitude:String,
                                viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (ADLatitudeAndLongitudeModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.New_Listing, method: .get,parameters: ["latitude": latitude, "longitude": longitude]) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ADLatitudeAndLongitudeModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func AdUnderListing(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (ADUnderListingModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.Under_Listing, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ADUnderListingModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func AdFeatureListing(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (ADFeatureListingModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.Feature_Listing, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ADFeatureListingModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func AdListingFilter(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (ADListingFilterModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.Feature_Listing, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<ADListingFilterModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func FindADs(viewcontroller : UIViewController = UIViewController(),
                 add:String,
                         success : @escaping (FindModel) -> Void,
                         failure : @escaping (NSError) -> Void)  {
          
          self.request(url: Constants.BASE_URL  + Constants.FIND_ADS + "\(add)/", method: .get) { (response) in
              
              if response.response?.statusCode == 200 {
                  do{
                      let value = try response.result.get()
                      success(Mapper<FindModel>().map(JSON: value as! [String : Any])!)
                  }catch{
                      failure(NSError())
                  }
                  
              }else{
                  failure(NSError())
              }
          }
      }
}

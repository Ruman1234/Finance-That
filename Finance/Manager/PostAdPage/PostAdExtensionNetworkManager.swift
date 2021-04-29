//
//  PostAdExtensionNetworkManager.swift
//  Finance
//
//  Created by Ammar Irfan on 20/04/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

extension NetworkManager {
       
    func TypeOfVehicle(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (TypeOfVehicleModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.TYPE_OF_VEHICLE, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<TypeOfVehicleModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    
    func FuelType(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (FuelTypeModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.FUEL_TYPE, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<FuelTypeModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func DriveTrain(viewcontroller : UIViewController = UIViewController(),
                       
                       success : @escaping (DriveTrainModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.DRIVE_TRAIN, method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<DriveTrainModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func Features(viewcontroller : UIViewController = UIViewController(),
                  id:String,
                       success : @escaping (FeaturesModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.FEATURE + "\(id)/", method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<FeaturesModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func SelectMake(viewcontroller : UIViewController = UIViewController(),
                    id :String,
                       success : @escaping (SelectMakeModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.SELECT_MAKE + "\(id)/", method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<SelectMakeModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func BodyType(viewcontroller : UIViewController = UIViewController(),
                  id : String,
                       success : @escaping (BodyTypeModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.BODY_TYPE + "\(id)/", method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<BodyTypeModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func SelectModel(viewcontroller : UIViewController = UIViewController(),
                     id:String,
                       success : @escaping (SelectModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.SELECT_MODEL + "\(id)/", method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<SelectModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
    func SelectTrim(viewcontroller : UIViewController = UIViewController(),
                     id:String,
                       success : @escaping (SelectModel) -> Void,
                       failure : @escaping (NSError) -> Void)  {
        
        self.request(url: Constants.BASE_URL  + Constants.SELECT_TRIM + "\(id)/", method: .get) { (response) in
            
            if response.response?.statusCode == 200 {
                do{
                    let value = try response.result.get()
                    success(Mapper<SelectModel>().map(JSON: value as! [String : Any])!)
                }catch{
                    failure(NSError())
                }
                
            }else{
                failure(NSError())
            }
        }
    }
    
}

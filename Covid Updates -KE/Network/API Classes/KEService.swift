//  KEService.swift
//  Covid Updates -KE
//  Created by Gerald on 22/10/2020.

import Foundation
import Moya

public enum KEService {
    case RequestKE(name: String)
}

extension KEService: TargetType {
    
    public var baseURL: URL {return URL(string: "https://rapidapi.p.rapidapi.com")! }
    
    public var path: String {
        switch self {
        case .RequestKE:
            return "/country"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .RequestKE:
        return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .RequestKE(let name):
        return .requestParameters(parameters: ["name": name], encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .RequestKE:
        return ("{}".data(using: String.Encoding.utf8)! as NSData) as Data
        }
    }
    
    public var mehod: Moya.Method {
        switch self {
        case .RequestKE:
        return .get
        }
    }
    
    public var headers: [String: String]? {
        return ["x-rapidapi-host": "covid-19-data.p.rapidapi.com",
                "x-rapidapi-key" : "3bee4b7e02msh0cf90a5b2a0ca73p15204cjsn43ca8fe36992"]
    }
}
    


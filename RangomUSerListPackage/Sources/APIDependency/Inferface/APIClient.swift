//
//  APIClient.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay
import Moya
import Model

//MARK: - Moya API
public enum RandomUserAPI {
    case getRandomUser
}

extension RandomUserAPI: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    public var baseURL: URL {
        return URL(string: "https://randomuser.me")!
    }
    
    public var path: String {
        return "/api"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Moya.Task {
        return .requestParameters(
            parameters: ["results" : "20",
                         "inc" : "name,email,picture,gender,login,dob,phone,location"],
            encoding: URLEncoding.queryString)
    }
    
    public var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
}

//MARK: - Inferface
public struct APIClient {
    public var getRandomUsers: @Sendable () async throws -> [ResultsResponse]
}

extension DependencyValues {
    public var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}

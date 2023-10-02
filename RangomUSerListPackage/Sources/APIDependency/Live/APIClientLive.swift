//
//  APIClientLive.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation
import Dependencies
import Moya
import Model
import Core

extension APIClient: DependencyKey {
    public static let liveValue = Self(
        getRandomUsers: {
            let provider = MoyaProvider<RandomUserAPI>()
            var randomUsers: RandomUsersResponse?
            
            provider.request(.getRandomUser) { result in
                switch result {
                case let .success(response) :
                    guard let randomUsersResponse = try? response.map(RandomUsersResponse.self) else { return }
                    
                    randomUsers = randomUsersResponse
                case let .failure(error):
                    return
                }
            }
            
            try await NetworkTask.sleep()
            return randomUsers
        }
    )
}


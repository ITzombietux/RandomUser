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
            var randomUsers: [ResultsResponse] = []
            
            provider.request(.getRandomUser) { result in
                switch result {
                case let .success(response) :
                    guard var randomUsersResponse = try? response.map(RandomUsersResponse.self) else { return }
                    
                    randomUsers = randomUsersResponse.results.filter { $0.gender == "male" }
                case let .failure(error):
                    return
                }
            }
            
            try await NetworkTask.sleep()
            return randomUsers
        }
    )
}


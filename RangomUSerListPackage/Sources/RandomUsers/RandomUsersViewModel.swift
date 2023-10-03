//
//  RandomUsersViewModel.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation
import Dependencies
import Model
import APIDependency

@MainActor
public final class RandomUsersViewModel: ObservableObject {
    @Published var randomUsers: [ResultsResponse] = []
    
    public init() {}
    
    @Dependency(\.apiClient) var apiClient
    
    public func onAppear() async {
        do {
            self.randomUsers = try await self.apiClient.getRandomUsers().results
        } catch {}
    }
    
    public func moreLoad() async {
        do {
            let existingUUIDs = randomUsers.map { $0.login.uuid }
            let randomUsers = try await self.apiClient.getRandomUsers().results
            randomUsers.forEach { randomUser in
                if !existingUUIDs.contains(randomUser.login.uuid) {
                    self.randomUsers.append(randomUser)
                }
            }
        } catch {}
    }
}

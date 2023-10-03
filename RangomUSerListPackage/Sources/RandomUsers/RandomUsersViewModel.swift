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
    @Published public var randomUsers: [ResultsResponse] = []
    @Published public var isShowing: Bool = false
    
    public init() {}
    
    @Dependency(\.apiClient) var apiClient
    
    public func onAppear() async {
        do {
            self.randomUsers = try await self.apiClient.getRandomUsers()
        } catch {}
    }
    
    public func onRefresh() async {
        isShowing = true
        
        do {
            self.randomUsers = try await self.apiClient.getRandomUsers()
            isShowing = false
        } catch {}
    }
    
    public func moreLoad() async {
        do {
            let existingUUIDs = randomUsers.map { $0.login.uuid }
            let randomUsers = try await self.apiClient.getRandomUsers()
            randomUsers.forEach { randomUser in
                if !existingUUIDs.contains(randomUser.login.uuid) {
                    self.randomUsers.append(randomUser)
                }
            }
        } catch {}
    }
}

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

public final class RandomUsersViewModel: ObservableObject {
    @Published var randomUsers: [ResultsResponse] = []
    
    public init() {}
    
    @Dependency(\.apiClient) var apiClient
    
    public func onAppear() async {
        do {
            self.randomUsers = try await self.apiClient.getRandomUsers().results
        } catch {}
    }
}

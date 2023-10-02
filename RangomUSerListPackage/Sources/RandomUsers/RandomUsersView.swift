//
//  RandomUsersView.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import SwiftUI

import RandomUser

public struct RandomUsersView: View {
    @ObservedObject private var viewModel: RandomUsersViewModel = RandomUsersViewModel()
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            ForEach(viewModel.randomUsers, id: \.self) { randomUser in
                
            }
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

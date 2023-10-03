//
//  RandomUsersView.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import SwiftUI

import RandomUser
import RandomUserDetail
import SwiftUIPullToRefresh

public struct RandomUsersView: View {
    @ObservedObject private var viewModel: RandomUsersViewModel = RandomUsersViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.randomUsers, id: \.self) { randomUser in
                    NavigationLink {
                        RandomUserDetailView(randomUser: randomUser)
                    } label: {
                        RandomUserView(randomUser: randomUser)
                            .onAppear {
                                if randomUser == self.viewModel.randomUsers.last {
                                    Task {
                                        await viewModel.moreLoad()
                                    }
                                }
                            }
                    }
                }
            }
            .navigationBarTitle("RandomUserList")
            .background(
                SwiftUIPullToRefresh(
                    action: {
                        Task {
                            await viewModel.onRefresh()
                        }
                    },
                    isShowing: $viewModel.isShowing)
            )
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

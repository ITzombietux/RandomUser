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
        VStack(alignment: .leading) {
            Text("랜덤 유저")
                .font(.system(size: 34, weight: .bold))
                .padding(.top)
                .padding()
            
            List {
                ForEach(viewModel.randomUsers, id: \.self) { randomUser in
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
            
            Spacer()
        }
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}

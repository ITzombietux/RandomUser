//
//  RandomUserView.swift
//  
//
//  Created by 10004 on 2023/10/03.
//

import SwiftUI

import Kingfisher
import RandomUserDetail
import Model

public struct RandomUserView: View {
    private let randomUser: ResultsResponse
    
    public init(randomUser: ResultsResponse) {
        self.randomUser = randomUser
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            KFImage(URL(string: randomUser.picture.thumbnail)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment:.leading, spacing: 4) {
                Text("\(randomUser.name.title). \(randomUser.name.first) \(randomUser.name.last)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.11))
                
                Text("이메일 : \(randomUser.email)")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
}


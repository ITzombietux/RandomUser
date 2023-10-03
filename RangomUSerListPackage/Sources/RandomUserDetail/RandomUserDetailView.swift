//
//  RandomUserDetailView.swift
//  
//
//  Created by 10004 on 2023/10/03.
//

import SwiftUI

import Model
import Kingfisher

public struct RandomUserDetailView: View {
    private let randomUser: ResultsResponse
    
    public init(randomUser: ResultsResponse) {
        self.randomUser = randomUser
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            KFImage(URL(string: randomUser.picture.medium)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(0)
                .frame(width: 160, height: 160, alignment: .center)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 4)
            
            Text("\(randomUser.name.title). \(randomUser.name.first) \(randomUser.name.last)")
                .font(.system(size: 16, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.11))
            
            Text("이메일 : \(randomUser.email)")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
            
            HStack(alignment: .center, spacing: 16) {
                InfoCell(title: "전화번호", image: "phone.fill", description: randomUser.phone)
                
                ZStack {}
                    .frame(width: 1, height: 60)
                    .background(Color(red: 0.89, green: 0.89, blue: 0.89))
                
                InfoCell(title: "나이", image: "person.fill", description: String(describing: randomUser.dob.age))
                
                ZStack {}
                    .frame(width: 1, height: 60)
                    .background(Color(red: 0.89, green: 0.89, blue: 0.89))
                
                InfoCell(title: "국가", image: "location.fill", description: randomUser.location.country)
            }
            .padding(0)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 28)
        .frame(width: 360, alignment: .top)
    }
    
    struct InfoCell: View {
        private let title: String
        private let image: String
        private let description: String
        
        init(title: String,
             image: String,
             description: String) {
            self.title = title
            self.image = image
            self.description = description
        }
        
        var body: some View {
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: image)
                    .foregroundColor(Color(red: 0.02, green: 0.07, blue: 0.26))
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47))
                    .frame(width: 76, alignment: .top)
                
                Text(description)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(red: 0.02, green: 0.07, blue: 0.26))
                    .frame(width: 100, alignment: .top)
            }
        }
    }
}

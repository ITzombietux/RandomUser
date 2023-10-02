//
//  SwiftUIView.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import SwiftUI

import RandomUsers

public struct RootView: View {
    public init() {}
    
    public var body: some View {
        RandomUsersView()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUsersView()
    }
}

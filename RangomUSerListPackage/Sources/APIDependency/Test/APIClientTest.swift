//
//  APIClientTest.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Dependencies
import XCTestDynamicOverlay

extension APIClient: TestDependencyKey {
    public static let testValue = Self(
        getRandomUsers: unimplemented("\(Self.self).getRandomUsers")
    )
}

//
//  APIClientTest.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Dependencies
import XCTestDynamicOverlay
import Model

extension APIClient: TestDependencyKey {
    public static let testValue = Self(
        getRandomUsers: unimplemented("\(Self.self).getRandomUsers")
    )
}

extension APIClient {
    public static func onAppearMock() -> APIClient {
        return APIClient(
            getRandomUsers: {
                return [
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa1"), login: LoginResponse(uuid: "AAAA-BBBB-1")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa2"), login: LoginResponse(uuid: "AAAA-BBBB-2")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa3"), login: LoginResponse(uuid: "AAAA-BBBB-3")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa4"), login: LoginResponse(uuid: "AAAA-BBBB-4")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa5"), login: LoginResponse(uuid: "AAAA-BBBB-5")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa6"), login: LoginResponse(uuid: "AAAA-BBBB-6"))
                ].filter { $0.gender == "male" }
            }
        )
    }
    
    public static func moreLoadMock() -> APIClient {
        return APIClient(
            getRandomUsers: {
                return [
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa1"), login: LoginResponse(uuid: "AAAA-BBBB-1")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa7"), login: LoginResponse(uuid: "AAAA-BBBB-7")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa8"), login: LoginResponse(uuid: "AAAA-BBBB-8")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa9"), login: LoginResponse(uuid: "AAAA-BBBB-9")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa10"), login: LoginResponse(uuid: "AAAA-BBBB-10")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa11"), login: LoginResponse(uuid: "AAAA-BBBB-11"))
                ].filter { $0.gender == "male" }
            }
        )
    }
    
    public static func refreshMock() -> APIClient {
        return APIClient(
            getRandomUsers: {
                return [
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa1"), login: LoginResponse(uuid: "AAAA-BBBB-1")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa7"), login: LoginResponse(uuid: "AAAA-BBBB-7")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa8"), login: LoginResponse(uuid: "AAAA-BBBB-8")),
                    ResultsResponse(gender: "female", name: NameResponse(title: "mansa9"), login: LoginResponse(uuid: "AAAA-BBBB-9")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa10"), login: LoginResponse(uuid: "AAAA-BBBB-10")),
                    ResultsResponse(gender: "male", name: NameResponse(title: "mansa11"), login: LoginResponse(uuid: "AAAA-BBBB-11"))
                ].filter { $0.gender == "male" }
            }
        )
    }
}

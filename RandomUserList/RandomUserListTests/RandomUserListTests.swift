//
//  RandomUserListTests.swift
//  RandomUserListTests
//
//  Created by 10004 on 2023/10/02.
//

import XCTest

import RandomUsers
import APIDependency
import Dependencies
import Model

@MainActor
final class RandomUserListTests: XCTestCase {
    func testDeleteFeamaleGenderRandomUsers() async throws {
        let model = withDependencies {
            $0.apiClient = .onAppearMock()
        } operation: {
            RandomUsersViewModel()
        }
        
        await model.onAppear()
        
        XCTAssertEqual(model.randomUsers.count, 4)
    }
    
    func testDeleteDuplicatedRandomUsers() async throws {
        let model = withDependencies {
            $0.apiClient = .moreLoadMock()
        } operation: {
            RandomUsersViewModel()
        }
        
        model.randomUsers = [ ResultsResponse(gender: "male", name: NameResponse(title: "mansa1"), login: LoginResponse(uuid: "AAAA-BBBB-1"))]
        
        await model.moreLoad()
        
        XCTAssertEqual(model.randomUsers.count, 4)
    }
    
    func testRefreshRandomUsers() async throws {
        let model = withDependencies {
            $0.apiClient = .refreshMock()
        } operation: {
            RandomUsersViewModel()
        }
        
        model.randomUsers = [
            ResultsResponse(gender: "male", name: NameResponse(title: "mansa15"), login: LoginResponse(uuid: "AAAA-BBBB-15")),
            ResultsResponse(gender: "male", name: NameResponse(title: "mansa16"), login: LoginResponse(uuid: "AAAA-BBBB-16"))]
        
        await model.onRefresh()
        
        XCTAssertEqual(model.randomUsers.count, 4)
    }
}

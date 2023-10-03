//
//  NetworkTask.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation

public struct NetworkTask {
    public static func sleep() async throws {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC)
    }
}


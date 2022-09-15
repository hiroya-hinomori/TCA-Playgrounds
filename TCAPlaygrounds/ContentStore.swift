//
//  ContentStore.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/14.
//

import Foundation
import ComposableArchitecture

enum ContentStore {
    struct State: Equatable {
        struct Location: Equatable {
            let latitude: Double
            let longitude: Double
        }
        
        var location: Location
        var isRendering: Bool = false
    }
    
    enum Action {
        case onAppear
        case onLoading(Bool)
    }
    
    struct Environment { }
    
    static let reducer = Reducer<State, Action, Self.Environment> { state, action, _ in
        switch action {
        case .onAppear:
            return .none
        case let .onLoading(isLoading) where isLoading == false:
            return .none
        default:
            return .none
        }
    }
}

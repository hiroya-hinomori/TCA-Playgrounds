//
//  TCAPlaygroundsApp.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/13.
//

import SwiftUI

@main
struct TCAPlaygroundsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: .init(
                    initialState: .init(
                        location: .init(latitude: 35.6869312, longitude: 139.7748535)
                    ),
                    reducer: ContentStore.reducer.debug(),
                    environment: .init()
                )
            )
            .environment(
                \.googleMapAPIKey,
                 Bundle.main.object(forInfoDictionaryKey: "GMSAPIKey") as! String
            )
        }
    }
}

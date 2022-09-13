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
            ContentView()
                .environment(
                    \.googleMapAPIKey,
                     Bundle.main.object(forInfoDictionaryKey: "GMSAPIKey") as! String
                )
        }
    }
}

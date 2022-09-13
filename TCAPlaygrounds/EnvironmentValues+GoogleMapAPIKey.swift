//
//  EnvironmentValues+GoogleMapAPIKey.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/13.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    private struct GoogleMapAPIKey: EnvironmentKey {
        static var defaultValue = ""
    }
    
    var googleMapAPIKey: String {
        get { self[GoogleMapAPIKey.self] }
        set { self[GoogleMapAPIKey.self] = newValue }
    }
}

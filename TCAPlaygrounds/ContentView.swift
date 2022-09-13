//
//  ContentView.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GoogleMapView()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.googleMapAPIKey, "")
    }
}

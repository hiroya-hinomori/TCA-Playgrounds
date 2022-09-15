//
//  ContentView.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/13.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<ContentStore.State, ContentStore.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack(alignment: .bottom) {
                GoogleMapView(
                    location: .init(
                        latitude: viewStore.location.latitude,
                        longitude: viewStore.location.longitude
                    ),
                    isRendering: viewStore.binding(
                        get: \.isRendering,
                        send: ContentStore.Action.onLoading
                    )
                )
                .ignoresSafeArea()
                Text("\(viewStore.location.latitude), \(viewStore.location.longitude)")
                    .font(.headline)
                if viewStore.isRendering {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black.opacity(0.5))
                            .ignoresSafeArea()
                        Text("Rendering...")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: .init(
                initialState: .init(
                    location: .init(latitude: 35.6869312, longitude: 139.7748535),
                    isRendering: true
                ),
                reducer: ContentStore.reducer,
                environment: .init()
            )
        )
        .environment(
            \.googleMapAPIKey,
             Bundle.main.object(forInfoDictionaryKey: "GMSAPIKey") as! String
        )
    }
}

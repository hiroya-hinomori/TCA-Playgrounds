//
//  GoogleMapView.swift
//  TCAPlaygrounds
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2022/09/13.
//

import GoogleMaps
import SwiftUI
import CoreLocation

struct GoogleMapView: UIViewRepresentable {
    
    @Environment(\.googleMapAPIKey) var apiKey: String
    @State var location: CLLocationCoordinate2D
    @Binding var isRendering: Bool
    
    func makeCoordinator() -> Coodinator {
        Coodinator(with: self)
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey(apiKey)
        GMSServices.setMetalRendererEnabled(true)
        let mapView = GMSMapView(
            frame: .zero,
            camera: .init(target: location, zoom: 18.0)
        )
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.animate(toLocation: .init(latitude: location.latitude, longitude: location.longitude))
    }
}

extension GoogleMapView {
    class Coodinator: NSObject, GMSMapViewDelegate {
        var parent: GoogleMapView
        
        init(with mapView: GoogleMapView) {
            parent = mapView
        }

        func mapViewSnapshotReady(_ mapView: GMSMapView) { }
        
        func mapViewDidStartTileRendering(_ mapView: GMSMapView) {
            parent.isRendering = true
        }
        
        func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
            parent.isRendering = false
        }
    }
}

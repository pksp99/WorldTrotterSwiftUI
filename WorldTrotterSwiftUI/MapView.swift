//
//  MapView.swift
//  WorldTrotterSwiftUI
//
//  Created by Preet Karia on 2/2/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    enum MapOptions: String, CaseIterable {
        case standard = "Standard"
        case imagery = "Imagery"
        case hybrid = "Hybrid"
        var mapStyle: MapStyle {
            switch self {
            case .standard:
                return MapStyle.standard
            case .hybrid:
                return MapStyle.hybrid
            case .imagery:
                return MapStyle.imagery
            }
        }
    }
    
    @State private var selectedMapOption: MapOptions = .standard
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.0386848, longitude: -76.1327507),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    private var syracuseUniCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 43.03876779557215, longitude: -76.13368147430579)
    }
    
    private var syracuseAirportCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 43.11157338329788, longitude: -76.11424869272673)
    }
    private var splitRockCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 43.02476524251817, longitude: -76.22308838887491)
    }
    var body: some View {
        ZStack {
            Map(initialPosition: .region(region)){
                Marker("Syracuse University", coordinate: syracuseUniCoordinate)
                Marker("Syracuse Airport", coordinate: syracuseAirportCoordinate)
                Marker("Split Rock", coordinate: splitRockCoordinate)
            }
            .mapStyle(selectedMapOption.mapStyle)
            VStack {
                Picker("Select an option", selection: $selectedMapOption) {
                    ForEach(MapOptions.allCases, id: \.self) { style in
                        Text(style.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.white.opacity(0.7))
                Spacer()
            }
        }
        .navigationTitle("Map")
    }
    
}
#Preview {
    MapView()
}

//
//  ContentView.swift
//  WorldTrotterSwiftUI
//
//  Created by Preet Karia on 1/27/24.
//

import SwiftUI

struct WorldTrotterView: View {
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: TemperatureConverterView()) {
                        Image("ConvertIcon")
                    }
                )
        }
    }
}

#Preview {
    WorldTrotterView()
}

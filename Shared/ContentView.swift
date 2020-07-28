//
//  ContentView.swift
//  Shared
//
//  Created by Prudhvi Gadiraju on 7/28/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListView()
                .navigationTitle("Names")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

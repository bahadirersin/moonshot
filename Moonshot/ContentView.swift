//
//  ContentView.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 1.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: []){
                }
            }.navigationTitle("Moonshot")
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

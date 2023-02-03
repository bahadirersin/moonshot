//
//  ContentView.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 1.02.2023.
//

import SwiftUI

struct ContentView: View {

    let astronauts:[String:Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions:[Mission] = Bundle.main.decode(file: "missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var gridToggle = true
    
    var body: some View {
        NavigationView{
            
            if(gridToggle){
                GridView(missions: missions, astronauts: astronauts)
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .toolbar{
                        Button("List View"){
                            gridToggle.toggle()
                        }
                        .foregroundColor(.secondary)
                    }
            }else{
                ListView(missions: missions, astronauts: astronauts)
                    .navigationTitle("Moonshot")
                    .toolbar{
                        Button("Grid View"){
                            gridToggle.toggle()
                        }
                        .foregroundColor(.secondary)
                    }
            }
            
        }.preferredColorScheme(.dark)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AstronautView.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 3.02.2023.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut:Astronaut
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text("Description:")
                    .font(.title2.bold())
                    .padding([.horizontal,.top])
                
                Text(astronaut.description)
                    .padding()
            }
        }.background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        
        let astronauts:[String:Astronaut] = Bundle.main.decode(file: "astronauts.json")
        
        AstronautView(astronaut: astronauts["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}

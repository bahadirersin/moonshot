//
//  ListView.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 3.02.2023.
//

import SwiftUI

struct ListView: View {
    
    let missions:[Mission]
    let astronauts:[String:Astronaut]
    
    var body: some View {
        List(missions){ mission in
            
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                }label: {
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height:50)
                        VStack(alignment: .leading){
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
        }
        .scrollContentBackground(.hidden)
        .background(.darkBackground)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let astronauts:[String:Astronaut] = Bundle.main.decode(file: "astronauts.json")
        let missions:[Mission] = Bundle.main.decode(file: "missions.json")
        
        ListView(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

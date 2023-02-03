//
//  MissionView.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 3.02.2023.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronaut
    }
    
    let astronauts:[String:Astronaut]
    let mission:Mission
    let crew:[CrewMember]
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,2)
                        
                        Text("Launch Date: \(mission.formattedLaunchDate)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(mission.description)
                    }
                    .padding([.leading,.trailing], 10)
                    
                    Divider()
                    
                    CrewSlider(mission: mission, astronauts: astronauts)
                        .padding(.leading,10)
                    
                }.padding(.bottom)
            }.navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
                .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
            
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        
        let missions:[Mission] = Bundle.main.decode(file: "missions.json")
        let astronauts:[String:Astronaut] = Bundle.main.decode(file: "astronauts.json")
        
        MissionView(mission:missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

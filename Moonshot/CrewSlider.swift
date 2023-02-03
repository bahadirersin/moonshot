//
//  CrewSlider.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 3.02.2023.
//

import SwiftUI

struct CrewSlider: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronaut
    }
    
    let crew:[CrewMember]
    let mission:Mission
    let astronauts:[String:Astronaut]
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Crew Members")
                .font(.title.bold())
                .padding(.bottom,5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink{
                            AstronautView(astronaut: crewMember.astronaut)
                        }label: {
                            HStack{
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 104,height: 72)
                                    .clipShape(Capsule())
                                    .overlay{
                                        Capsule()
                                            .strokeBorder(.white,lineWidth: 1)
                                    }
                                
                                VStack(alignment: .leading){
                                    Text(crewMember.role)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
        
                    }
                }
            }
        }
    }
    
    init(mission:Mission, astronauts: [String:Astronaut]) {
        self.astronauts = astronauts
        self.mission = mission
        self.crew = mission.crew.map{ crewMember in
            if let astronaut = astronauts[crewMember.name]{
                return CrewMember(role: crewMember.role, astronaut: astronaut)
            }else{
                fatalError("Couldn't find \(crewMember.name)")
            }
        }
    }
    
}

struct CrewSlider_Previews: PreviewProvider {
    static var previews: some View {
        
        let missions:[Mission] = Bundle.main.decode(file: "missions.json")
        let astronauts:[String:Astronaut] = Bundle.main.decode(file: "astronauts.json")
        
        CrewSlider(mission:missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

//
//  MissionView.swift
//  Moonshot
//
//  Created by Saad Ahmad on 06/10/2026.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role:String
        let astronaut : Astronaut
    }
    let mission : Mission
    let members : [CrewMember]
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){
                        width,axis in width * 0.6
                    }
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(members,id: \.role) { member in
                        NavigationLink{
                            AstronautView(astronaut: member.astronaut)
                            
                        }label: {
                            HStack {
                                Image(member.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:104, height:72)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                                
                                
                                VStack (alignment: .leading){
                                    Text(member.astronaut.name)
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                    Text(member.role)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
            }
        }.navigationTitle(mission.display)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
    }
    init(mission: Mission, members: [String : Astronaut]) {
        self.mission = mission
        self.members = mission.crew.map{
            member in
            if let astronaut = members[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0],members: astronauts)
        .preferredColorScheme(.dark)
}

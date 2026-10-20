//
//  ContentView.swift
//  Moonshot
//
//  Created by Saad Ahmad on 30/09/2026.
//

import SwiftUI

struct ContentView: View {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack{
            ScrollView{
            LazyVGrid(columns: columns){
                ForEach(missions){mission in
                    NavigationLink{
                        MissionView(mission: mission, members: astronauts)
                    } label: {
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack{
                                Text(mission.display)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                
                            }.padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                                
                        )
                       
                       
                    }
                    
                }
                    
                } .padding()
            }.navigationTitle("Apollo Missions")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
        }
    }
}
#Preview {
    ContentView()
}

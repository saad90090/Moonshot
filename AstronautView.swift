//
//  AstronautView.swift
//  Moonshot
//
//  Created by Saad Ahmad on 07/10/2026.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
            } .padding()
            
            
            
        }.navigationTitle(astronaut.name)
           
        
    }
}

#Preview {
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
  return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}

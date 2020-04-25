//
//  ContentView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-20.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI
import AudioKit
import Combine

struct ContentView: View {
    
    @EnvironmentObject var conductor: Conductor
    
    var body: some View {
        
        VStack {
        
        TabView {
        
            PlayingSurfaceView()
            .tabItem {
                Text("Linnstrument")
            }
            
            SmallSurfaceView()
            .tabItem {
                Text("Linnstrument 128")
            }
        }
           // Spacer()
            HStack {
                Spacer()
                Text("Note: \(self.conductor.noteName)")
                    .font(.title)
                Spacer()
                Text("Velocity: \(self.conductor.velocity)")
                    .font(.title)
                Spacer()
                Text("MIDI Channel: \(self.conductor.channel)")
                    .font(.body)
            }
                Spacer()
            
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Conductor())
    }
}

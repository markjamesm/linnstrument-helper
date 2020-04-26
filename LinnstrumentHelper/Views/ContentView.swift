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

    NotesView()

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Conductor())
    }
}

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
    
   // let c = Conductor()
    
    @EnvironmentObject var conductor: Conductor
    
    var body: some View {
        Text("Notenumber: \(conductor.noteNumber)")
      //  Text("Notes: \(conductor.notesHeld)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear() {
             //   let c = Conductor()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Conductor())
    }
}

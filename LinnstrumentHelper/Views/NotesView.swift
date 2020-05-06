//
//  NotesView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-25.
//  Copyright © 2020 Mark-James M. All rights reserved.
//  https://markjames.dev
//

import SwiftUI

struct NotesView: View {

    @EnvironmentObject var conductor: Conductor

    var body: some View {

        VStack {
            HStack {

                Text("Note: \(self.conductor.noteOneName)")
                    .font(.title)
                    .padding()
                
                Text("Note 2: \(self.conductor.noteTwoName)")
                .font(.title)
                .padding()
                
                Text("Note 3: \(self.conductor.noteThreeName)")
                .font(.title)
                .padding()
                
                Text("Note 4: \(self.conductor.noteFourName)")
                .font(.title)
                .padding()
            }
            HStack {
                Spacer()
                Text("Velocity: \(self.conductor.velocity)")
                    .font(.title)
                Spacer()
                Text("MIDI Channel: \(self.conductor.channel)")
                    .font(.body)
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView().environmentObject(Conductor())
    }
}

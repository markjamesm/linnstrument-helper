//
//  NotesView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-25.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI

struct NotesView: View {

    @EnvironmentObject var conductor: Conductor

    var body: some View {

        VStack {
            HStack {

                if conductor.noteOnePressed && conductor.smallNote1GridPos != 0 {

                Spacer()
                Text("Note: \(self.conductor.noteOneName)")
                    .font(.title)
                }

                if conductor.noteTwoPressed && conductor.smallNote2GridPos != 0 {

                Text("Note 2: \(self.conductor.noteTwoName)")
                .font(.title)
                }

                if conductor.noteThreePressed && conductor.smallNote3GridPos != 0 {

                Text("Note 3: \(self.conductor.noteThreeName)")
                .font(.title)
                }

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

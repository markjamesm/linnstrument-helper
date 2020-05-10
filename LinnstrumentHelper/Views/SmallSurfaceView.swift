//
//  PlayingSurfaceView.swift - Linnstrument 128 configuration
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//  https://markjames.dev
//

import SwiftUI
import Grid

struct SmallSurfaceView: View {

    @EnvironmentObject var conductor: Conductor

    @State var selection: Int = 0
    @State var selection1: Int = 80
    @State var items: [Item] = (0 ... 127).map { Item(number: $0) }
    @State var showSettings: Bool = false
    @State var style = ModularGridStyle(columns: 16, rows: .fixed(70))
    
    let midiEngine = MIDIEngine()

    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { self.showSettings = true }) {
                Text("Settings")
            }
            ScrollView(style.axes) {
                Grid(items) { item in
                    Card(title: "\(item.shortNoteNames[item.number])", color: item.color)

                     //   .onTapGesture {
                        //    self.conductor.note1 = UInt8(item.number)
                     //       print(item.number)
                     //   }
                }

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    ZStack {
                        ForEach(self.midiEngine.mapSmallGridNotes(note: self.conductor.note1), id: \.self) { note in
                            NoteBorder(color: .blue, rect: preferences[note])
                        }
                        ForEach(self.midiEngine.mapSmallGridNotes(note: self.conductor.note2), id: \.self) { note in
                            NoteBorder(color: .green, rect: preferences[note])
                        }
                        ForEach(self.midiEngine.mapSmallGridNotes(note: self.conductor.note3), id: \.self) { note in
                            NoteBorder(color: .orange, rect: preferences[note])
                        }
                        ForEach(self.midiEngine.mapSmallGridNotes(note: self.conductor.note4), id: \.self) { note in
                            NoteBorder(color: .red, rect: preferences[note])
                        }
                    }
                }
            }
        }
        .sheet(isPresented: self.$showSettings) {
            ModularGridSettingsView(style: self.$style)
        }
        .gridStyle(
            self.style
        )
    }
}

struct SmallSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmallSurfaceView().environmentObject(Conductor())
    }
}

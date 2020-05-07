//
//  PlayingSurfaceView.swift - Linnstrument 200 configuration
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//  https://markjames.dev
//

import SwiftUI
import Grid

struct PlayingSurfaceView: View {
    @State var selection: Int = 0
    @State var items: [Item] = (0...199).map { Item(number: $0) }
    @State var showSettings: Bool = false
    @State var style = ModularGridStyle(columns: 25, rows: .fixed(60))

    @EnvironmentObject var conductor: Conductor
    
    let midiEngine = MIDIEngine()

   var body: some View {
            VStack(alignment: .trailing) {
                Button(action: { self.showSettings = true }) {
                    Text("Settings")
                }
                ScrollView(style.axes) {
                    Grid(items) { item in
                        Card(title: "\(item.noteNames[item.number])", color: item.color)

                        //    .onTapGesture {
                       //         self.conductor.note1 = UInt8(item.number)
                       //         print(item.number)
                       //    }
                    }
                    
                    .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
    
                        ZStack {
                            ForEach(self.midiEngine.mapGridNotes(note: self.conductor.note1), id: \.self) { note in
                                NoteBorder(color: .blue, rect: preferences[note])
                            }
                            ForEach(self.midiEngine.mapGridNotes(note: self.conductor.note2), id: \.self) { note in
                                NoteBorder(color: .green, rect: preferences[note])
                            }
                            ForEach(self.midiEngine.mapGridNotes(note: self.conductor.note3), id: \.self) { note in
                                NoteBorder(color: .orange, rect: preferences[note])
                            }
                            ForEach(self.midiEngine.mapGridNotes(note: self.conductor.note4), id: \.self) { note in
                                NoteBorder(color: .red, rect: preferences[note])
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
}


struct PlayingSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingSurfaceView().environmentObject(Conductor())
    }
}


//
//  PlayingSurfaceView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI
import Grid

struct PlayingSurfaceView: View {
    @State var selection: Int = 0
    @State var items: [Item] = (0...199).map { Item(number: $0) }
    @State var showSettings: Bool = false
    @State var style = ModularGridStyle(columns: 25, rows: .fixed(60))
    
    @EnvironmentObject var conductor: Conductor
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { self.showSettings = true }) {
                Text("Settings")
            }
            ScrollView(style.axes) {
                Grid(items) { item in
                    Card(title: "\(item.noteNames[item.number])", color: item.color, midiNoteNumber: UInt8(item.number))
                        .onTapGesture {
                         //   self.selection = item.midiNoteNumber
                     //       print(item.number)
                       //     print(items.)
                        }
                }
                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.white)
                        .frame(
                            width: preferences[self.selection].width,
                            height: preferences[self.selection].height
                        )
                        .position(
                            x: preferences[self.selection].midX,
                            y: preferences[self.selection].midY
                        )
                      //  .animation(.linear)
                }
                .padding(16)
            }

        }
     //   .sheet(isPresented: self.$showSettings) {
      //      ModularGridSettingsView(style: self.$style)
    //    }
        .gridStyle(
            self.style
        )
    }
}

struct PlayingSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmallSurfaceView()
    }
}

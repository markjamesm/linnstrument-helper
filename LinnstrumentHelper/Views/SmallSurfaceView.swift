//
//  PlayingSurfaceView.swift - Linnstrument 128 configuration
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
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
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { self.showSettings = true }) {
                Text("Settings")
            }
            ScrollView(style.axes) {
                Grid(items) { item in
                    Card(title: "\(item.shortNoteNames[item.number])", color: item.color)
                        
                        .onTapGesture {
                            
                            self.conductor.note1 = UInt8(item.number)
                       //     print(item.shortMIDINoteNumber[item.number])
                            print(item.number)

                           }
                        
                      //  .onReceive(self.conductor.$lastNote, perform: { note in

                     //   })
                
                }

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.blue)
                        .frame(
                            width: preferences[Int(self.conductor.note1)].width,
                            height: preferences[Int(self.conductor.note1)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.note1)].midX,
                            y: preferences[Int(self.conductor.note1)].midY
                        )
                    //    .animation(.default)
                }
                
                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.purple)
                        .frame(
                            width: preferences[Int(self.conductor.note2)].width,
                            height: preferences[Int(self.conductor.note2)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.note2)].midX,
                            y: preferences[Int(self.conductor.note2)].midY
                        )
                }

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.orange)
                        .frame(
                            width: preferences[Int(self.conductor.note3)].width,
                            height: preferences[Int(self.conductor.note3)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.note3)].midX,
                            y: preferences[Int(self.conductor.note3)].midY
                        )
                }
                    
                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.red)
                        .frame(
                            width: preferences[Int(self.conductor.note4)].width,
                            height: preferences[Int(self.conductor.note4)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.note4)].midX,
                            y: preferences[Int(self.conductor.note4)].midY
                        )
                }
                    
                .padding()
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

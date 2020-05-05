//
//  PlayingSurfaceView.swift - Linnstrument 200 configuration
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
                        Card(title: "\(item.noteNames[item.number])", color: item.color)

                            .onTapGesture {
                                self.conductor.note1 = UInt8(item.number)
                               }
                    }

                    .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                        
                        Group {
                            if self.conductor.note1 != nil {

                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(lineWidth: 4)
                            .foregroundColor(.blue)
                            .frame(
                                width: preferences[Int(self.conductor.note1!)].width,
                                height: preferences[Int(self.conductor.note1!)].height
                            )
                            .position(
                                x: preferences[Int(self.conductor.note1!)].midX,
                                y: preferences[Int(self.conductor.note1!)].midY
                            )
                            } else {
                                EmptyView()
                            }
                        }
                    }

                    .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                        
                        Group {
                        if self.conductor.note2 != nil {

                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(lineWidth: 4)
                            .foregroundColor(.purple)
                            .frame(
                                width: preferences[Int(self.conductor.note2!)].width,
                                height: preferences[Int(self.conductor.note2!)].height
                            )
                            .position(
                                x: preferences[Int(self.conductor.note2!)].midX,
                                y: preferences[Int(self.conductor.note2!)].midY
                            )
                            }  else {
                                    EmptyView()
                                }
                        }
                    }

                    .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                        
                        Group {
                            if self.conductor.note3 != nil {

                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(lineWidth: 4)
                            .foregroundColor(.orange)
                            .frame(
                                width: preferences[Int(self.conductor.note3!)].width,
                                height: preferences[Int(self.conductor.note3!)].height
                            )
                            .position(
                                x: preferences[Int(self.conductor.note3!)].midX,
                                y: preferences[Int(self.conductor.note3!)].midY
                            )
                            } else {
                                EmptyView()
                            }
                    }

                    .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                        
                        Group {
                            if self.conductor.note4 != nil {

                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(lineWidth: 4)
                                    .foregroundColor(.red)
                                    .frame(
                                        width: preferences[Int(self.conductor.note4!)].width,
                                        height: preferences[Int(self.conductor.note4!)].height
                                )
                                    .position(
                                        x: preferences[Int(self.conductor.note4!)].midX,
                                        y: preferences[Int(self.conductor.note4!)].midY
                                )
                                } else {
                                    EmptyView()
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
}

struct PlayingSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingSurfaceView().environmentObject(Conductor())
    }
}


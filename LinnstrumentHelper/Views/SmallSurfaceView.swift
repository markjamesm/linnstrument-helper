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
                            print(item.number)

                           }
                }
                    

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.blue)
                        .frame(
                            width: preferences[Int(self.conductor.smallNote1GridPos)].width,
                            height: preferences[Int(self.conductor.smallNote1GridPos)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.smallNote1GridPos)].midX,
                            y: preferences[Int(self.conductor.smallNote1GridPos)].midY
                        )
                }
                
                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.purple)
                        .frame(
                            width: preferences[Int(self.conductor.smallNote2GridPos)].width,
                            height: preferences[Int(self.conductor.smallNote2GridPos)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.smallNote2GridPos)].midX,
                            y: preferences[Int(self.conductor.smallNote2GridPos)].midY
                        )
                }

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.orange)
                        .frame(
                            width: preferences[Int(self.conductor.smallNote3GridPos)].width,
                            height: preferences[Int(self.conductor.smallNote3GridPos)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.smallNote3GridPos)].midX,
                            y: preferences[Int(self.conductor.smallNote3GridPos)].midY
                        )
                }
                    
                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.red)
                        .frame(
                            width: preferences[Int(self.conductor.smallNote4GridPos)].width,
                            height: preferences[Int(self.conductor.smallNote4GridPos)].height
                        )
                        .position(
                            x: preferences[Int(self.conductor.smallNote4GridPos)].midX,
                            y: preferences[Int(self.conductor.smallNote4GridPos)].midY
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

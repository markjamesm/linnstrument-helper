//
//  SettingsView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-23.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI
import Grid

struct ModularGridSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var conductor: Conductor
    @Binding var style: ModularGridStyle

    var body: some View {
        VStack {
            HStack(spacing: 300) {
                Text("Note Spacing (\(Int(self.style.spacing)))").fixedSize()
            } //.padding()
            Slider(value: self.$style.spacing, in: 0...32)

            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("Close")
            }
            Spacer()
        }
        .padding()
        .pickerStyle(
            SegmentedPickerStyle()
        )
    }
}

struct ModularGridSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ModularGridSettingsView(style: .constant(ModularGridStyle(columns: 3, rows: 3)))
    }
}

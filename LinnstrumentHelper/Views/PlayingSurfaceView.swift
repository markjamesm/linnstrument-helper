//
//  PlayingSurfaceView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI
import Combine
import Grid

struct PlayingSurfaceView: View {
    var body: some View {
        ScrollView() {
        
            Grid(0 ..< 200) {_ in
                Rectangle()
                .foregroundColor(.gray)
            }
        }.padding()
        .gridStyle(
            ModularGridStyle(columns: 20, rows: .fixed(60))
        )
    }
}

struct PlayingSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingSurfaceView()
    }
}

//
//  SmallSurfaceView.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI
import Combine
import Grid

struct SmallSurfaceView: View {
    
  //  @State var items: [Item] = (0...100).map { Item(number: $0) }
    @State var selection: Int = 0
    
    var body: some View {
        VStack {
        
            Grid(0 ..< 128) {note in
                Rectangle()
                .foregroundColor(.gray)
            }
        }.padding()
        .gridStyle(
            ModularGridStyle(columns: 16, rows: .fixed(60))
        )
    }
}

struct SmallSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmallSurfaceView()
    }
}

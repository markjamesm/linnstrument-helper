//
//  NoteBorder.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-05-05.
//  Copyright © 2020 Mark-James M. All rights reserved.
//  https://markjames.dev
//

import SwiftUI

struct NoteBorder: View {
    let color: Color
    let rect: CGRect

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
               .strokeBorder(lineWidth: 4)
               .foregroundColor(color)
               .frame(
                   width: rect.width,
                   height: rect.height
           )
               .position(
                   x: rect.midX,
                   y: rect.midY
           )
    }
}

struct NoteBorder_Previews: PreviewProvider {
    static var previews: some View {
        NoteBorder(color: .red, rect: CGRect(width: 50, height: 50))
    }
}

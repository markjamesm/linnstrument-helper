import SwiftUI
import Grid

struct SmallSurfaceView: View {
    
    @EnvironmentObject var conductor: Conductor
    
    @State var selection: Int = 0
    @State var selection1: Int = 0
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
                    Card(title: "\(item.shortNoteNames[item.number])", color: item.color, gridNumber: item.number)
                        
                        .onTapGesture {
                            
                            self.selection = item.number
                            print(item.number)

                           }
                        
                        .onReceive(self.conductor.$noteNumber, perform: { note in
                            
                            self.selection = Int(note)
                        })
                }

                .overlayPreferenceValue(GridItemBoundsPreferencesKey.self) { preferences in
                    
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(lineWidth: 4)
                        .foregroundColor(.blue)
                        .frame(
                            width: preferences[self.selection].width,
                            height: preferences[self.selection].height
                        )
                        .position(
                            x: preferences[self.selection].midX,
                            y: preferences[self.selection].midY
                        )
                    //    .animation(.default)
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

struct SmallSurfaceView_Previews: PreviewProvider {
    static var previews: some View {
        SmallSurfaceView().environmentObject(Conductor())
    }
}

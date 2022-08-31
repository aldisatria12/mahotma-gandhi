//
//  TopMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 29/08/22.
//

import SwiftUI

struct TopMenuView: View {
    
    var floorNumber : Int
    
    var body: some View {
        HStack {
            Text("Floor - \(floorNumber)")
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.047)
                .font(.system(size: 30))
                .foregroundColor(blue04)
            Spacer()
            Button("Menu") {
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.094)
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView(floorNumber: 1)
    }
}

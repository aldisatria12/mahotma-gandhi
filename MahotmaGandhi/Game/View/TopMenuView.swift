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
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 18 / 844)
                .font(.system(size: 30))
                .foregroundColor(blue04)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "questionmark.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 24 / 390, height: UIScreen.main.bounds.height * 31 / 844)
                    .foregroundColor(blue04)
                    .padding(.trailing, 15)
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

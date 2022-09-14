//
//  TutorialTopMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 06/09/22.
//

import SwiftUI

struct TutorialTopMenuView: View {
    
    let floorNumber : String
    
    var body: some View {
        HStack {
            Spacer()
            Text("Floor - \(floorNumber)")
                .font(.system(size: 30,design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(blue04)
            Spacer()
        } // HStack
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 45 / 844)
    }
}

struct TutorialTopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTopMenuView(floorNumber: "0")
    }
}

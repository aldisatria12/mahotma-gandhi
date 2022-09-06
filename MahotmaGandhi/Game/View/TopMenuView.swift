//
//  TopMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 29/08/22.
//

import SwiftUI

struct TopMenuView: View {
    
    var gameVM : GameViewModel
    
    
    var body: some View {
        HStack {
            Text("Floor - \(gameVM.gameFloor)")
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 18 / 844)
                .font(.system(size: 30,design: .rounded).bold())
                .foregroundColor(blue04)
            Spacer()
            Button {
                gameVM.showingPauseMenu = true
            } label: {
                Image(systemName: "pause.fill")
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
        TopMenuView(gameVM: GameViewModel(players: []))
    }
}

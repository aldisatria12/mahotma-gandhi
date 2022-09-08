//
//  TutorialTopMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 06/09/22.
//

import SwiftUI

struct TutorialTopMenuView: View {
    
    var gameVM : GameViewModel
    
    var body: some View {
        HStack {
            Button {
//                gameVM.finishTutorial()
            } label: {
                Text("Skip")
            }
            .frame(width: UIScreen.main.bounds.width * 40 / 390, height: UIScreen.main.bounds.height * 31 / 844)
            Spacer()
            Text("Floor - 0")
//                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 18 / 844)
                .font(.system(size: 30,design: .rounded))
                .foregroundColor(blue04)
//                .padding(.bottom, 40)
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
            } // Button
        } // HStack
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 45 / 844)
//        .background(.gray)
    }
}

struct TutorialTopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTopMenuView(gameVM: GameViewModel(players: []))
    }
}

//
//  BottomMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 30/08/22.
//

import SwiftUI

struct BottomMenuView: View {
    
    @ObservedObject var vm : GameViewModel
    
    var body: some View {
        VStack {
            ZStack{
                Image("turnsBackground")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 0.21)
                PlayerTurnView(playerTurnViewModel: PlayerTurnCardViewModel(playerVM: vm))
                    .offset(y: 15)
                
            }
//            Button("Next Floor") {
//                vm.goToNextFloor()
//                vm.animateMovement()
//            }
//            .padding([.horizontal], UIScreen.main.bounds.width / 2 - 50)
//            .padding(.vertical)
//
//            .border(.gray)
//            .background(.gray)
//            .padding(.bottom)
//            .foregroundColor(.black)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
        .background(.black)
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView(vm: GameViewModel(players: [PlayerModel(name: "Atest", avatar: "M1")]))
    }
}

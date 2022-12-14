//
//  GameView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm : GameViewModel
    
    var body: some View {
        ZStack {
            ZStack {
                FloorView(id:0, keyFrameIndex: vm.mainCounter[0] ?? 0, gameVM: vm)
                FloorView(id:1, keyFrameIndex: vm.mainCounter[1] ?? 1, gameVM: vm)
                FloorView(id:2, keyFrameIndex: vm.mainCounter[2] ?? 2, gameVM: vm)
            } // ZStack
            VStack {
                ZStack {
                    ForEach(0..<vm.game.players.count, id: \.self) { i in
                        if vm.isMoving {
                            WalkAnimationView(player: $vm.allPlayers[i])
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))
                        } else {
                            IdleAnimationView(player: $vm.allPlayers[i])
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))
                        }
                    } // ForEach
                } // ZStack
                
            } // VStack
            ZStack {
                AnimationView(keyFrameIndex: vm.mainCounter[0] ?? 0, id:0, gameVM: vm)
                AnimationView(keyFrameIndex: vm.mainCounter[1] ?? 1, id:1, gameVM: vm)
                AnimationView(keyFrameIndex: vm.mainCounter[2] ?? 2, id:2, gameVM: vm)
            } // ZStack
            VStack {
                if vm.isTopMenuShowed {
                    TopMenuView(gameVM: vm)
                }
                Spacer()
                BottomMenuView(vm: vm, card: $vm.isCardOpen)
                    .offset(y: 38)
            } // VStack
            if vm.isCardOpen {
                CardGameView(vm: vm, openCard: $vm.isCardOpen)
            }
            if vm.showingPauseMenu {
                PauseMenuView(closePauseMenu: $vm.showingPauseMenu, showingPlayerView: $vm.showingPlayerMenu)
            }
            if vm.showingPlayerMenu{
//                ManagePlayerView(gameVM: vm)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            vm.goToNextFloor()
        }
    }
    //        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(vm: GameViewModel(players: [PlayerModel(name: "Test", avatar: "M1")]))
    }
}

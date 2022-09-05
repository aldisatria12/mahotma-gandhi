//
//  GameView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm : GameViewModel
    
    
    @State var counter = 0
    
    var body: some View {
        ZStack {
            ZStack {
                FloorView(id:0, keyFrameIndex: vm.counterFirst, gameVM: vm)
                FloorView(id:1, keyFrameIndex: vm.counterSecond, gameVM: vm)
                FloorView(id:2, keyFrameIndex: vm.counterThird, gameVM: vm)
            }
            VStack {
                ZStack {
                    ForEach(0..<vm.game.players.count, id: \.self) { i in
                        if vm.isMoving {
                            PlayerAnimationWalkView()
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))
                            
                        } else {
                            PlayerAnimationIdleView()
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))
                        }
                        // PlayerAnimationView(player: $vm.game.players[i])
                        //     .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                        //     .offset(y: CGFloat(i * 62))
                    }
                }
                
                //                    PlayerAnimationView()
                //                        .position(x: geometry.size.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
            }
            ZStack {
                TopAnimationView(keyFrameIndex: vm.counterFirst)
                BottomAnimationView(keyFrameIndex: vm.counterFirst)
                TopAnimationView(keyFrameIndex: vm.counterSecond)
                BottomAnimationView(keyFrameIndex: vm.counterSecond)
                TopAnimationView(keyFrameIndex: vm.counterThird)
                BottomAnimationView(keyFrameIndex: vm.counterThird)
            }
            VStack {
                if vm.isTopMenuShowed {
                    TopMenuView(floorNumber: vm.gameFloor)
                }
                //                Spacer()
                //                Text(vm.gameTitle)
                //                Text(vm.gameQuestion)
                Spacer()
                BottomMenuView(vm: vm, card: $vm.isCardOpen)
                    .offset(y: 38)
            }
            if vm.isCardOpen {
                CardGameView(vm: vm, openCard: $vm.isCardOpen)
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

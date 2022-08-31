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
                    FloorView(keyFrameIndex: vm.counterFirst, gameVM: vm)
                    FloorView(keyFrameIndex: vm.counterSecond, gameVM: vm)
                    FloorView(keyFrameIndex: vm.counterThird, gameVM: vm)
                }
                VStack {
                    PlayerAnimationView()
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
                        let _ = print("masuk top menu")
                    }
                    //                Spacer()
                    //                Text(vm.gameTitle)
                    //                Text(vm.gameQuestion)
                    Spacer()
                    BottomMenuView(vm: vm)
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

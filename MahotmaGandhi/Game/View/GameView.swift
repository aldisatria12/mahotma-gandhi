//
//  GameView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm : GameViewModel
    
    @State var cardOpen = false
    
    var body: some View {
            ZStack {
                ZStack {
                    FloorView(keyFrameIndex: vm.counterFirst)
                    FloorView(keyFrameIndex: vm.counterSecond)
                    FloorView(keyFrameIndex: vm.counterThird)
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
                    Button (action: {
                        cardOpen.toggle()
                    }, label: {
                        Image("Chest")
                    })
                    Spacer()
                    BottomMenuView(vm: vm)
                }
                if cardOpen {
                    CardGameView(vm: vm, openCard: $cardOpen)
                }
            }
        .navigationBarHidden(true)
        .onAppear {
            vm.goToNextFloor()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(vm: GameViewModel(players: [PlayerModel(name: "Test", avatar: "M1")]))
    }
}

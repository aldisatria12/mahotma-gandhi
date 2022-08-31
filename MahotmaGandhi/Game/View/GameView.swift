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
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    FloorView(keyFrameIndex: vm.counterFirst)
                    FloorView(keyFrameIndex: vm.counterSecond)
                    FloorView(keyFrameIndex: vm.counterThird)
                }
                VStack {
                    ZStack {
                        ForEach(0..<vm.game.players.count, id: \.self) { i in
                            PlayerAnimationView(player: $vm.game.players[i])
                                .position(x: geometry.size.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 75))
                        }
                    }
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
    //                Spacer()
    //                Text(vm.gameTitle)
    //                Text(vm.gameQuestion)
                    Spacer()
                    BottomMenuView(vm: vm, card: $cardOpen)
                }
            }
            if cardOpen {
                CardGameView(vm: vm, openCard: $cardOpen)
            }
        }
        .navigationBarHidden(true)
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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

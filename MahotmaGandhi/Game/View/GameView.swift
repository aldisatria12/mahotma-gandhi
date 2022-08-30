//
//  GameView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var vm : GameViewModel = GameViewModel()
    
    var body: some View {
        
        ZStack {
            ZStack {
                FloorView(keyFrameIndex: vm.counterFirst)
                FloorView(keyFrameIndex: vm.counterSecond)
                FloorView(keyFrameIndex: vm.counterThird)
            }
            VStack {
                PlayerAnimationView()
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
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
                TopMenuView(floorNumber: vm.gameFloor)
//                Spacer()
//                Text(vm.gameTitle)
//                Text(vm.gameQuestion)
                Spacer()
                BottomMenuView(vm: vm)
            }
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear {
            vm.goToNextFloor()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

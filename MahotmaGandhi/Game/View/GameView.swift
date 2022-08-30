//
//  GameView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 26/08/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var vm : GameViewModel = GameViewModel()
    
    @State var cardOpen = false
    
    var body: some View {
        
        ZStack {
            ZStack {
                FloorView(keyFrameIndex: vm.counterFirst)
                FloorView(keyFrameIndex: vm.counterSecond)
                FloorView(keyFrameIndex: vm.counterThird)
            }
            VStack {
                TopMenuView(floorNumber: vm.gameFloor)
                Spacer()
                Button (action: {
                    cardOpen.toggle()
                }, label: {
                    Text("klik")
                })
                Spacer()
                BottomMenuView(vm: vm)
            }
            if cardOpen {
                CardGameView(vm: vm, openCard: $cardOpen)
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

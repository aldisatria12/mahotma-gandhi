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
        VStack {
            Text(vm.gameFloor)
            Text(vm.gameTitle)
            Text(vm.gameQuestion)
            Button ("Next Floor") {
                vm.goToNextFloor()
            }
        }.onAppear {
            vm.goToNextFloor()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

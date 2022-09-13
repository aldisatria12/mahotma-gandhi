//
//  TutorialBottomMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 08/09/22.
//

import SwiftUI

struct TutorialBottomMenuView: View {
    @ObservedObject var vm : TutorialViewModel
    @Binding var card: Bool
    var body: some View {
        VStack {
            ZStack{
                Image("turnsBackground")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 0.21)
                TutorialPlayerTurnView(tutorialVM: vm, card: $vm.isMoving)
                    .offset(y: 15)
            }
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
        .background(.black)
    }
}

//struct TutorialBottomMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialBottomMenuView(card: false)
//    }
//}

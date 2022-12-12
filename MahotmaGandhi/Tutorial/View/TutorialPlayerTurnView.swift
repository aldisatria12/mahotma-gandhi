//
//  TutorialPlayerTurnView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 12/09/22.
//

import SwiftUI

struct TutorialPlayerTurnView: View {
    @ObservedObject var tutorialVM : TutorialViewModel
    @Binding var card: Bool
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.gray)
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<tutorialVM.dummyPlayers.count, id: \.self) {i in
                        PlayerTurnCardView(player: $tutorialVM.dummyPlayers[i], card: $card, turns: i + 1, divider: i == tutorialVM.dummyPlayers.count - 1 ? false : true)
//                        Divider()
                    }

                }//HStack
                .padding()
                .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
            }//ScrollView
            
        }//ZStack
        .frame(height: 126 / 844 * UIScreen.main.bounds.height)
        .padding()
        .onAppear {
//            playerTurnViewModel.randomizeTurn()
        }
//        .onChange(of: card) { newValue in
//            if card == true {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
////                    playerTurnViewModel.randomizeTurn()
//                }
//            }
//        }
//        Text("Test")
//            .onTapGesture {
//                playerTurnViewModel.randomTurnPlayer = playerTurnViewModel.randomizeTurn()
//            }
    }

}

//struct TutorialPlayerTurnView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialPlayerTurnView()
//    }
//}

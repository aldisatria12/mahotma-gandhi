//
//  AllPlayerView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 08/09/22.
//

import SwiftUI

struct AllPlayerView: View {
    @StateObject var playerViewModel = PlayerViewModel()
    @State var editPlayer: Bool = false
    @State var selectedPlayer: Int = 0
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        ZStack {
            Image("CreateParty_Background")
                .ignoresSafeArea()
            VStack{
                Rectangle().frame(height: 29)
                    .foregroundColor(.clear)
                AllPlayerNavBarView()
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer().frame(height: (UIScreen.main.bounds.height * 89 / 844) + 15)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0 ..< 6, id: \.self) { i in
                        if playerViewModel.allPlayer.count == i {
                            AddPlayerView(allPlayer: $playerViewModel.allPlayer, editedPlayer: $selectedPlayer, editMode: $editPlayer)
                        } else if i < playerViewModel.allPlayer.count {
                            CardPlayerView(selectedPlayer: .constant(i), editedPlayer: $selectedPlayer, allPlayer: $playerViewModel.allPlayer, editMode: $editPlayer)
                        } else {
                            BlankView()
                        }
                        
                        //                    CardPlayerView()
                    }
                }.padding(.horizontal)
            }
            //            .ignoresSafeArea()
            .navigationBarHidden(true)
            if editPlayer {
                NewPlayerView(allPlayer: $playerViewModel.allPlayer, selectedPlayer: $playerViewModel.allPlayer[selectedPlayer], avatarName: $playerViewModel.avatarName,  editMode: $editPlayer)
            }
        }
    }
}



//struct AllPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPlayerView()
//    }
//}

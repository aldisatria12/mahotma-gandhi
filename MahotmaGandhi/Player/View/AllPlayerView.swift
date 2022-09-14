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
    @State var refresh:Bool = false
    @State var cancelAdd: Bool = false
    @State var offset: CGFloat = 1000
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
                AllPlayerNavBarView(allPlayers: $playerViewModel.allPlayer)
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer().frame(height: (UIScreen.main.bounds.height * 89 / 844) + 15)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0 ..< 6, id: \.self) { i in
                        if playerViewModel.allPlayer.count == i {
                            AddPlayerView(allPlayer: $playerViewModel.allPlayer, editedPlayer: $selectedPlayer, editMode: $editPlayer, cancelAdd: $cancelAdd)
                        } else if i < playerViewModel.allPlayer.count {
                            if refresh == true || refresh == false{
                                CardPlayerView(selectedPlayer: .constant(i), editedPlayer: $selectedPlayer, allPlayer: $playerViewModel.allPlayer, editMode: $editPlayer, refresh: $refresh)
                            }
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
                NewPlayerView(allPlayer: $playerViewModel.allPlayer, selectedPlayer: $selectedPlayer, avatarName: $playerViewModel.avatarName,  editMode: $editPlayer, cancelAdd: $cancelAdd)
//                    .animation(.linear(duration: 0.5), value: editPlayer)
//                    .offset(y: editPlayer ? 0 : 500)
//                    .onChange(of: editPlayer) { newValue in
//                        withAnimation() {
//                            if editPlayer {
//                                offset = 0
//                            } else {
//                                offset = 1000
//                            }
//                        }
//                    }
            }
        }
    }
}



//struct AllPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPlayerView()
//    }
//}

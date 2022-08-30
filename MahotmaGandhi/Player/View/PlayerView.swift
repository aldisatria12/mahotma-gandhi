//
//  PlayerView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 30/08/22.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var playerViewModel: PlayerViewModel = PlayerViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<playerViewModel.allPlayer.count, id: \.self) { i in
                            ZStack{
                                CardPlayerMiniView(name: playerViewModel.allPlayer[i].name, avatar: playerViewModel.allPlayer[i].avatar, selected: playerViewModel.selectedPlayer == i ? Color.green : Color.black)
                                    .simultaneousGesture(TapGesture().onEnded({ _ in
                                        playerViewModel.playerSelect(selectPlayer: i)
                                    }))
                                //Remove button
                                if i > 0 {
                                    VStack{
                                        HStack{
                                            Spacer()
                                            Button {
                                                playerViewModel.playerRemove(removeAt: i)
                                            } label: {
                                                Image(systemName: "minus.square.fill")
                                                    .resizable()
                                                    .foregroundColor(Color.red)
                                                    .frame(width: 16, height: 16)
                                            }
                                        }
                                        Spacer()
                                    }
                                }// remove button if
                                //
                            }//Card player mini
                        }//foreach
                        if playerViewModel.allPlayer.count < 6 {
                            CardAddPlayerView()
                                .simultaneousGesture(TapGesture().onEnded({ _ in
                                    playerViewModel.addPlayer()
                                }))
                        }//if allPlayer
                    }//hstack
                    .padding(5)
                }//scrollviewH
                .padding(.horizontal)
                CardPlayerInputView(selectedPlayer: $playerViewModel.allPlayer[playerViewModel.selectedPlayer])
                PlayerAvatarSelectionView(allPlayer: $playerViewModel.allPlayer, selectedPlayer: $playerViewModel.allPlayer[playerViewModel.selectedPlayer], avatarName: $playerViewModel.avatarName)
                Spacer()
            }//vstack
        }//scrollview
        .navigationTitle("Add Player")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink(destination: GameView(vm: GameViewModel(players: playerViewModel.allPlayer))) {
                Text("Start")
            }
        }
    }
}
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

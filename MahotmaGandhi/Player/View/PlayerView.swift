//
//  PlayerView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 30/08/22.
//

import SwiftUI

struct PlayerView: View {
    @StateObject var playerViewModel = PlayerViewModel()
    var body: some View {
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

struct ManagePlayerView: View {
    @ObservedObject var gameVM: GameViewModel
    @State var selectedPlayer = 0
    @State var avatarName = ["M1","M2","M3","M4","F1","F2","F3","F4"]
    var body: some View {
        ScrollView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<gameVM.game.players.count, id: \.self) { i in
                            ZStack{
                                CardPlayerMiniView(
                                    name: gameVM.game.players[i].name,
                                    avatar: gameVM.game.players[i].avatar,
                                    selected: selectedPlayer == i ? Color.green : Color.black)
                                    .simultaneousGesture(TapGesture().onEnded({ _ in
                                        selectedPlayer = i
                                    }))
//                                Remove button
                                if i > 0 {
                                    VStack{
                                        HStack{
                                            Spacer()
                                            Button {
                                                if i <= selectedPlayer {
                                                    selectedPlayer -= 1
                                                }
                                                gameVM.game.players.remove(at: i)
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
                        if gameVM.game.players.count < 6 {
                            CardAddPlayerView()
                                .simultaneousGesture(TapGesture().onEnded({ _ in
//                                    playerViewModel.addPlayer()
                                    var randomAva = "M1"
                                    selectedPlayer = gameVM.game.players.count
                                    while gameVM.game.players.contains(where: {$0.avatar == randomAva}) {
                                        randomAva = avatarName[Int.random(in: 0...avatarName.count - 1)]
                                    }
                                    gameVM.game.players.append(PlayerModel(name: "", avatar: randomAva))
                                }))
                        }//if allPlayer
                    }//hstack
                    .padding(5)
                }//scrollviewH
                .padding(.horizontal)
                CardPlayerInputView(selectedPlayer: $gameVM.game.players[selectedPlayer])
                PlayerAvatarSelectionView(allPlayer: $gameVM.game.players, selectedPlayer: $gameVM.game.players[selectedPlayer], avatarName: $avatarName)
                Spacer()
                Button (action: {
                    gameVM.showingPlayerMenu.toggle()
                }, label: {
                    Text("Resume")
                })
            }//vstack
        }//scrollview
        .navigationTitle("Manage Player")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView()
//    }
//}

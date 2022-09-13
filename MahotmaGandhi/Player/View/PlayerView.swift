////
////  PlayerView.swift
////  MahotmaGandhi
////
////  Created by Aldi Mahotma on 30/08/22.
////
//
//import SwiftUI
//
//struct PlayerView: View {
//    @ObservedObject var playerViewModel = PlayerViewModel()
//    var body: some View {
//        ScrollView{
//            VStack{
//                ScrollView(.horizontal){
//                    HStack{
//                        ForEach(0..<playerViewModel.allPlayer.count, id: \.self) { i in
//                            ZStack{
//                                CardPlayerMiniView(name: playerViewModel.allPlayer[i].name, avatar: playerViewModel.allPlayer[i].avatar, selected: playerViewModel.selectedPlayer == i ? Color.green : Color.black)
//                                    .simultaneousGesture(TapGesture().onEnded({ _ in
//                                        playerViewModel.playerSelect(selectPlayer: i)
//                                    }))
//                                //Remove button
//                                if i > 0 {
//                                    VStack{
//                                        HStack{
//                                            Spacer()
//                                            Button {
//                                                playerViewModel.playerRemove(removeAt: i)
//                                            } label: {
//                                                Image(systemName: "minus.square.fill")
//                                                    .resizable()
//                                                    .foregroundColor(Color.red)
//                                                    .frame(width: 16, height: 16)
//                                            }
//                                        }
//                                        Spacer()
//                                    }
//                                }// remove button if
//                                //
//                            }//Card player mini
//                        }//foreach
//                        if playerViewModel.allPlayer.count < 6 {
//                            CardAddPlayerView()
//                                .simultaneousGesture(TapGesture().onEnded({ _ in
//                                    playerViewModel.addPlayer()
//                                }))
//                        }//if allPlayer
//                    }//hstack
//                    .padding(5)
//                }//scrollviewH
//                .padding(.horizontal)
//                CardPlayerInputView(selectedPlayer: $playerViewModel.allPlayer[playerViewModel.selectedPlayer])
//                PlayerAvatarSelectionView(allPlayer: $playerViewModel.allPlayer, selectedPlayer: $playerViewModel.allPlayer[playerViewModel.selectedPlayer], avatarName: playerViewModel.avatarName)
//                Spacer()
//            }//vstack
//        }//scrollview
//        .navigationTitle("Add Player")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            NavigationLink(destination: GameView(vm: GameViewModel(players: playerViewModel.allPlayer))) {
//                Text("Start")
//            }
//        }
//    }
//}
//
//struct ManagePlayerView: View {
//    @ObservedObject var gameVM: GameViewModel
//    @State var selectedPlayer = 0
//    var avatarName = ["Wayfarer", "Guardian", "M1", "M2", "M3", "M4", "F1", "F2"]
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .frame(width: .infinity, height: .infinity)
//                .ignoresSafeArea()
//                .foregroundColor(.gray)
////            background(.gray)
////                .ignoresSafeArea()
//            VStack {
//                Text("ManagePlayer")
//                    .font(.system(.title, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.center)
//                ScrollView(.horizontal){
//                    HStack{
//                        ForEach(0..<gameVM.allPlayers.count, id: \.self) { i in
//                            ZStack{
//                                CardPlayerMiniView(
//                                    name: gameVM.allPlayers[i].name,
//                                    avatar: gameVM.allPlayers[i].avatar,
//                                    selected: selectedPlayer == i ? Color.green : Color.black)
//                                .simultaneousGesture(TapGesture().onEnded({ _ in
//                                    selectedPlayer = i
//                                }))
//                                //                                Remove button
//                                if i > 0 {
//                                    VStack{
//                                        HStack{
//                                            Spacer()
//                                            Button {
//                                                if i <= selectedPlayer {
//                                                    selectedPlayer -= 1
//                                                }
//                                                gameVM.allPlayers.remove(at: i)
//                                                gameVM.objectWillChange.send()
//                                            } label: {
//                                                Image(systemName: "minus.square.fill")
//                                                    .resizable()
//                                                    .foregroundColor(Color.red)
//                                                    .frame(width: 16, height: 16)
//                                            }
//                                        }
//                                        Spacer()
//                                    }
//                                }// remove button if
//                                //
//                            }//Card player mini
//                        }//foreach
//                        if gameVM.game.players.count < 6 {
//                            CardAddPlayerView()
//                                .simultaneousGesture(TapGesture().onEnded({ _ in
//                                    //                                    playerViewModel.addPlayer()
//                                    var randomAva = "M1"
//                                    selectedPlayer = gameVM.allPlayers.count
//                                    while gameVM.allPlayers.contains(where: {$0.avatar == randomAva}) {
//                                        randomAva = avatarName[Int.random(in: 0...avatarName.count - 1)]
//                                    }
//                                    gameVM.allPlayers.append(PlayerModel(name: "", avatar: randomAva))
//                                    gameVM.objectWillChange.send()
//                                }))
//                        }//if allPlayer
//                    }//hstack
//                    .padding(5)
//                }//scrollviewH
//                .padding(.horizontal)
//                CardPlayerInputView(selectedPlayer: $gameVM.allPlayers[selectedPlayer])
//                PlayerAvatarSelectionView(allPlayer: $gameVM.allPlayers, selectedPlayer: $gameVM.allPlayers[selectedPlayer], avatarName: avatarName)
//                Spacer()
//                Button (action: {
//                    gameVM.showingPlayerMenu.toggle()
//                }, label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 12)
//                            .foregroundColor(blue01)
//                        Text("Resume")
//                            .font(.system(.title, design: .rounded))
//                            .fontWeight(.medium)
//                            .foregroundColor(yellow03)
//                    }
//                    .frame(width: 200, height: 40, alignment: .center)
//                })
//            }//vstack
//
//        }//scrollview)
//    }
//}
//
////struct PlayerView_Previews: PreviewProvider {
////    static var previews: some View {
////        PlayerView()
////    }
////}

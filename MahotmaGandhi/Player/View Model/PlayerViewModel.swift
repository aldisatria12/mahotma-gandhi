//
//  PlayerViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct PlayerViewModel: View {
    @State var allPlayer = [PlayerModel(name: "", avatar: "M1")]
    @State var selectedPlayer: Int = 0
    @State var avatarName = ["M1","M2","M3","M4","F1","F2","F3","F4"]
    var body: some View {
            NavigationView{
                ScrollView{
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0..<allPlayer.count, id: \.self) { i in
                                ZStack{
                                    CardPlayerMiniView(name: allPlayer[i].name, avatar: allPlayer[i].avatar, selected: selectedPlayer == i ? Color.green : Color.black)
                                        .simultaneousGesture(TapGesture().onEnded({ _ in
                                            selectedPlayer = i
                                        }))
                                    //Remove button
                                    if i > 0 {
                                        VStack{
                                            HStack{
                                                Spacer()
                                                Button {
                                                    if i <= selectedPlayer {
                                                        selectedPlayer -= 1
                                                    }
                                                    allPlayer.remove(at: i)
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
                            if allPlayer.count < 6 {
                                CardAddPlayerView()
                                    .simultaneousGesture(TapGesture().onEnded({ _ in
                                        var randomAva = "M1"
                                        selectedPlayer = allPlayer.count
                                        while allPlayer.contains(where: {$0.avatar == randomAva}) {
                                            randomAva = avatarName[Int.random(in: 0...avatarName.count - 1)]
                                        }
                                        allPlayer.append(PlayerModel(name: "", avatar: randomAva))
                                    }))
                            }//if allPlayer
                        }//hstack
                        .padding(5)
                    }//scrollviewH
                    .padding(.horizontal)
                    CardPlayerInputView(selectedPlayer: $allPlayer[selectedPlayer])
                    PlayerAvatarSelectionView(allPlayer: $allPlayer, selectedPlayer: $allPlayer[selectedPlayer], avatarName: $avatarName)
                    Spacer()
                }//vstack
            }//scrollview
            .navigationTitle("Add Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: PlayerTurnCardViewModel(allPlayer: $allPlayer)) {
                    Text("Test")
                }
            }
        }
    }
}

struct PlayerViewModel_Previews: PreviewProvider {
    static var previews: some View {
        PlayerViewModel()
    }
}

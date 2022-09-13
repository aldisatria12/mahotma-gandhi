//
//  CharacterNewView.swift
//  DialogueTest
//
//  Created by Aldi Mahotma on 09/09/22.
//

import SwiftUI

struct NewPlayerView: View {
    @Binding var allPlayer: [PlayerModel]
    @Binding var selectedPlayer: PlayerModel
    @Binding var avatarName: [String]
    @State var playerName: String = ""
    @State var oldAvatar: String = ""
    @Binding var editMode: Bool
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 29 / 844)
                .ignoresSafeArea()
                .foregroundColor(blue01)
            ZStack {
                PlayerNavBar(editMode: $editMode, selectedPlayer: $selectedPlayer, playerName: $playerName, oldAvatar: $oldAvatar)
            }
            ZStack {
                Image("AddPlayer_Preview")
                VStack(alignment: .center){
                    Spacer()
                    NameTextBox(playerName: $playerName)
                        .offset(y: -UIScreen.main.bounds.height * 12 / 844)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 248 / 844)
            ZStack {
                PlayerAvatarSelectionView(allPlayer: $allPlayer, selectedPlayer: $selectedPlayer, avatarName: $avatarName)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 266 / 844)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(blue01)
        .onAppear {
            oldAvatar = selectedPlayer.avatar
        }
    }
}

struct PlayerNavBar: View {
    @Binding var editMode: Bool
    @Binding var selectedPlayer: PlayerModel
    @Binding var playerName: String
    @Binding var oldAvatar: String
    var body: some View {
        Image("AddPlayer_Navbar")
        HStack {
            Button {
                selectedPlayer.avatar = oldAvatar
                print(selectedPlayer.avatar)
                editMode = false
            } label: {
                Image(systemName: "chevron.backward.circle.fill").imageScale(.large)
                    .foregroundColor(blue03)
                    .padding(.leading)
            }

            Spacer()
            Button {
                selectedPlayer.name = playerName
                editMode = false
            } label: {
                Text("Done")
                    .frame(width: UIScreen.main.bounds.width * 64 / 390, height: UIScreen.main.bounds.height * 36 / 844)
                    .background(yellow02)
                    .foregroundColor(blue01)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
                    .padding(.trailing)
            }

        }
    }
}

struct NameTextBox: View {
    @Binding var playerName: String
    @State var placeholder: Bool = true
    var body: some View {
        ZStack{
            TextField("Input your name", text: $playerName)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 240 / 390, height: UIScreen.main.bounds.height * 42 / 844)
                .foregroundColor(blue01)
                .onChange(of: playerName) { newValue in
                    if playerName == "" {
                        placeholder = true
                    } else {
                        placeholder = false
                    }
                }
                .background(yellow03)
                .clipShape(RoundedRectangle(cornerRadius: 12))
//            if placeholder {
//                Text("Input your name")
//                    .foregroundColor(.black)
//                    .opacity(0.5)
//            }
        }
    }
}

struct CharacterNewView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlayerView(allPlayer: .constant([PlayerModel(name: "", avatar: "")]), selectedPlayer: .constant(PlayerModel(name: "", avatar: "")), avatarName: .constant([""]), editMode: .constant(true))
    }
}

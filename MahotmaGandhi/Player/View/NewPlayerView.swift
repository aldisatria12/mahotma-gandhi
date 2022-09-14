//
//  CharacterNewView.swift
//  DialogueTest
//
//  Created by Aldi Mahotma on 09/09/22.
//

import SwiftUI

extension View{
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct NewPlayerView: View {
    @Binding var allPlayer: [PlayerModel]
    @Binding var selectedPlayer: Int
    @Binding var avatarName: [String]
    @State var playerName: String = ""
    @State var oldAvatar: String = ""
    @Binding var editMode: Bool
    @Binding var cancelAdd: Bool
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 29 / 844)
                .ignoresSafeArea()
                .foregroundColor(blue01)
            ZStack {
                PlayerNavBar(allPlayer: $allPlayer,editMode: $editMode, selectedPlayer: $selectedPlayer, playerName: $playerName, oldAvatar: $oldAvatar, cancelAdd: $cancelAdd)
            }
            ZStack {
                Image("AddPlayer_Preview")
                if selectedPlayer >= 0 {
                    PlayerAnimationWalkView(avatar: allPlayer[selectedPlayer].avatar,stopTimer: .constant(false))
                }
                VStack(alignment: .center){
                    Spacer()
                    NameTextBox(playerName: $playerName)
                        .offset(y: -UIScreen.main.bounds.height * 12 / 844)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 248 / 844)
            ZStack {
                if selectedPlayer >= 0 {
                    PlayerAvatarSelectionView(allPlayer: $allPlayer, selectedPlayer: $allPlayer[selectedPlayer], avatarName: $avatarName)                    
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 266 / 844)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(blue01)
        .onAppear {
            oldAvatar = allPlayer[selectedPlayer].avatar
            print(oldAvatar)
            playerName = allPlayer[selectedPlayer].name
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct PlayerNavBar: View {
    @Binding var allPlayer: [PlayerModel]
    @Binding var editMode: Bool
    @Binding var selectedPlayer: Int
    @Binding var playerName: String
    @Binding var oldAvatar: String
    @Binding var cancelAdd: Bool
    var body: some View {
        Image("AddPlayer_Navbar")
        HStack {
            Button {
                allPlayer[selectedPlayer].avatar = oldAvatar
                print(oldAvatar)
                editMode = false
                if cancelAdd == true {
                    if selectedPlayer == allPlayer.count - 1 {
                        selectedPlayer -= 1
                    }
                    allPlayer.remove(at: allPlayer.count-1)
                    cancelAdd = false
                }
            } label: {
                Image(systemName: "chevron.backward.circle.fill").imageScale(.large)
                    .foregroundColor(blue03)
                    .padding(.leading)
            }

            Spacer()
            Button {
                allPlayer[selectedPlayer].name = playerName
                editMode = false
                cancelAdd = false
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
        NewPlayerView(allPlayer: .constant([PlayerModel(name: "", avatar: "")]), selectedPlayer: .constant(0), avatarName: .constant([""]), editMode: .constant(true), cancelAdd: .constant(true))
    }
}

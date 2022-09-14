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
                PlayerAnimationWalkView(player: $allPlayer[selectedPlayer],stopTimer: .constant(false))
                VStack(alignment: .center){
                    Spacer()
                    NameTextBox(playerName: $playerName)
                        .offset(y: -UIScreen.main.bounds.height * 12 / 844)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 248 / 844)
            ZStack {
                PlayerAvatarSelectionView(allPlayer: $allPlayer, selectedPlayer: $allPlayer[selectedPlayer], avatarName: $avatarName)
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
                ZStack{
                    Circle()
                        .foregroundColor(blue01)
                        .frame(width: 32, height: 32)
                    Circle()
                        .foregroundColor(blue03)
                        .frame(width: 26, height: 26)
                    Image(systemName: "lessthan")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .foregroundColor(blue01)
                        .frame(width: 13, height: 17, alignment: .center)
                }
            }
            .frame(width: 32, height: 32)
            .padding(.leading)
            
            Spacer()
            Button {
                allPlayer[selectedPlayer].name = playerName
                editMode = false
                cancelAdd = false
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width * 64 / 390, height: UIScreen.main.bounds.height * 36 / 844)
                        .foregroundColor(blue01)
                    Text("Done")
                        .font(.system(size: 16, design: .rounded))
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width * 58 / 390, height: UIScreen.main.bounds.height * 30 / 844)
                        .background(yellow02)
                        .foregroundColor(blue01)
                        .clipShape(RoundedRectangle(cornerRadius: 36))
                }
            }
            .padding(.trailing)
            
        }
    }
}

struct NameTextBox: View {
    @Binding var playerName: String
    @State var placeholder: Bool = true
    var body: some View {
        ZStack {
            TextField("", text: $playerName)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(blue01)
                .multilineTextAlignment(.center)
                .placeholder(when: playerName.isEmpty) {
                    Text("Player Name")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(yellow01)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width * 240 / 390, height: UIScreen.main.bounds.height * 42 / 844)
                }
                .frame(width: UIScreen.main.bounds.width * 240 / 390, height: UIScreen.main.bounds.height * 42 / 844)
                .background(yellow03)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

//struct CharacterNewView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlayerView(allPlayer: .constant([PlayerModel(name: "", avatar: "")]), selectedPlayer: .constant(PlayerModel(name: "", avatar: "")), avatarName: .constant([""]), editMode: .constant(true), cancelAdd: .constant(true))
//    }
//}

//
//  CardPlayerView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 08/09/22.
//

import SwiftUI

struct CardPlayerView: View {
    @Binding var selectedPlayer: Int
    @Binding var editedPlayer: Int
    @Binding var allPlayer: [PlayerModel]
    @Binding var editMode: Bool
    @State var check:Bool = false
    @Binding var refresh:Bool
    var body: some View {
        ZStack {
            Image("PlayerCard_Filled")
                .frame(width: UIScreen.main.bounds.width * 155 / 340, height: UIScreen.main.bounds.height * 221 / 844)
            VStack {
//                if let p = $allPlayer[selectedPlayer]{
                if selectedPlayer < allPlayer.count{
                    if selectedPlayer >= 0 {
                        PlayerAnimationIdleView(avatar: allPlayer[selectedPlayer].avatar, stopTimer: $check)
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))                        
                    }
                    Text(allPlayer[selectedPlayer].name)
                        .font(.system(size: 19, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(blue01)
                        .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                }
//                }
                
            }
            .onTapGesture {
                editedPlayer = selectedPlayer
                editMode = true
            }
            ZStack {
                if selectedPlayer > 0 {
                    Button(action: {
                        allPlayer.remove(at: selectedPlayer)
                        check = true
                        refresh.toggle()
                        selectedPlayer = 0
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 35 / 390 * UIScreen.main.bounds.width, height: 35 / 844 * UIScreen.main.bounds.height)
                                .foregroundColor(red01)
                            Circle()
                                .frame(width: 32 / 390 * UIScreen.main.bounds.width, height: 32 / 844 * UIScreen.main.bounds.height)
                                .foregroundColor(red02)
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .foregroundColor(yellow03)
                                .frame(width: 25 / 390 * UIScreen.main.bounds.width, height: 25 / 844 * UIScreen.main.bounds.height)
                        }
                    })
                }
            }
            .frame(width: 35 / 390 * UIScreen.main.bounds.width, height: 35 / 844 * UIScreen.main.bounds.height)
            .position(x: 155 / 390 * UIScreen.main.bounds.width, y: 10 / 844 * UIScreen.main.bounds.height)
        }
    }
}

struct AddPlayerView: View {
    @StateObject var playerViewModel = PlayerViewModel()
    @Binding var allPlayer: [PlayerModel]
    @Binding var editedPlayer: Int
    @Binding var editMode: Bool
    @Binding var cancelAdd: Bool
    var body: some View {
        ZStack {
            Image("PlayerCard_Empty")
                .frame(width: UIScreen.main.bounds.width * 155 / 340, height: UIScreen.main.bounds.height * 221 / 844)
            VStack {
                Button(action: {
//                    allPlayer.append(PlayerModel(name: "", avatar: ""))
                    playerViewModel.addPlayer(editedPlayer: &allPlayer)
                    editedPlayer = allPlayer.count - 1
                    editMode = true
                    cancelAdd = true
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 74 / 390 * UIScreen.main.bounds.width, height: 74 / 844 * UIScreen.main.bounds.height)
                            .foregroundColor(blue03)
                        Image(systemName: "plus")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(blue01)
                            .frame(width: 34 / 390 * UIScreen.main.bounds.width, height: 36 / 844 * UIScreen.main.bounds.height)
                    }
                })
                Text("Add Player")
                    .font(.system(size: 17, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(blue01)
            }
        }
    }
}

struct BlankView: View {
    var body: some View {
        ZStack {
            Image("PlayerCard_Empty")
                .frame(width: UIScreen.main.bounds.width * 155 / 340, height: UIScreen.main.bounds.height * 221 / 844)
        }
    }
}

//struct CardPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardPlayerView()
//    }
//}

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
                        PlayerAnimationIdleView(player: $allPlayer[selectedPlayer], stopTimer: $check)
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))                        
                    }
                    Text(allPlayer[selectedPlayer].name)
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
                                .frame(width: 35, height: 35)
                                .foregroundColor(red01)
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(red02)
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .foregroundColor(yellow03)
                                .frame(width: 25, height: 25)
                        }
                    })
                }
            }
            .frame(width: 35, height: 35)
            .position(x: 155, y: 10)
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
                            .frame(width: 70, height: 70)
                            .foregroundColor(.red)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                })
                Text("Add Player")
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

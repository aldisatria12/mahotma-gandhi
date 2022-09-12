//
//  PlayerAvatarSelectionView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct PlayerAvatarSelectionView: View {
    @Binding var allPlayer: [PlayerModel]
    @Binding var selectedPlayer: PlayerModel
    @Binding var avatarName: [String]
    @State var seen: Bool = true
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        ]
    var body: some View {
        ZStack{
            Image("AddPlayer_Menu")
            ScrollView {
                        LazyVGrid(columns: columns, spacing: 2) {
                            ForEach(avatarName, id: \.self) { item in
                                if allPlayer.contains(where: {$0.avatar == item}){
                                    Image("\(item)_Icon")
                                        .resizable()
                                        .frame(width: 72, height: 72)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .grayscale(selectedPlayer.avatar == item ? 0 : 0.9995)
                                        .overlay(Circle().stroke(yellow02,lineWidth: selectedPlayer.avatar == item ? 3 : 0).opacity(seen ? 1 : 0))
                                        .onAppear {
                                            withAnimation (.linear(duration: 0.5).repeatForever()) {
                                                seen.toggle()
                                            }
                                        }
                                } else {
                                    Image("\(item)_Icon")
                                        .resizable()
                                        .frame(width: 72, height: 72)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .simultaneousGesture(TapGesture().onEnded({ _ in
                                            selectedPlayer.avatar = item
                                        }))
                                }
                                    
                            }
                        }
                        .padding()
            }
            
        }
        .padding()
    }
}

//struct PlayerAvatarSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerAvatarSelectionView(allPlayer: .constant([PlayerModel(name: "Testing", avatar: "M1")]), selectedPlayer: .constant(PlayerModel(name: "Testing", avatar: "M1")), avatarName: .constant(["M1","M2","M3","M4","F1","F2","F3","F4"]))
//    }
//}

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
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        ]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
            ScrollView {
                        LazyVGrid(columns: columns, spacing: 2) {
                            ForEach(avatarName, id: \.self) { item in
                                if allPlayer.contains(where: {$0.avatar == item}){
                                    Image("\(item)_Icon")
                                        .resizable()
                                        .frame(width: 72, height: 72)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .grayscale(0.9995)
                                        .overlay(Circle().stroke(Color.green,lineWidth: selectedPlayer.avatar == item ? 2 : 0))
                                    
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
        .frame(height: 240)
    }
}

//struct PlayerAvatarSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerAvatarSelectionView(allPlayer: .constant([PlayerModel(name: "Testing", avatar: "M1")]), selectedPlayer: .constant(PlayerModel(name: "Testing", avatar: "M1")), avatarName: .constant(["M1","M2","M3","M4","F1","F2","F3","F4"]))
//    }
//}

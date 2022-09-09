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
    var avatarName: [String]
    @State var opac: CGFloat = 1
    @State var seen: Bool = true
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
//    @State var isToogle = false
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        ]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(blue02)
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
                                        .grayscale(selectedPlayer.avatar == item ? 0 : 0.9995)
                                        .overlay(Circle().stroke(yellow02,lineWidth: selectedPlayer.avatar == item ? 2 : 0).opacity(opac))
//                                        .animation(Animation.linear(duration: 0.1).repeatForever())
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
                        .onReceive(timer) { _ in
                            seen.toggle()
                            withAnimation {
                                if seen {
                                    opac = 1
                                } else {
                                    opac = 0.5
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

//
//  PlayerTurnCardView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 26/08/22.
//

import SwiftUI

struct PlayerTurnCardView: View {
    @Binding var player: PlayerModel
    @Binding var card: Bool
    var turns: Int
    var divider: Bool = true
    @State var offset: CGFloat = 400
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 12, style: .continuous)
//                .foregroundColor(.gray)
//                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
            HStack{
                VStack{
                    Text("\(turns)")
                        .padding(.init(top: 0, leading: 0, bottom: -2, trailing: 0))
//                        .font(.caption)
                        .font(.system(.caption, design: .rounded))
                    Image("\(player.avatar)_Icon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .clipShape(Circle())
                    Text(player.name)
                        .font(.system(.caption2, design: .rounded))
                }//vstack
                .frame(width: 68, height: 42)
            }
            
        }//zstack
//        .frame(width: 96, height: 138)
        
        //Animation 1
        .offset(x: offset)
        .onAppear {
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 2).delay(Double(turns) * 0.333)) {
                offset = 0
            }
        }
        //
        //Animation 2
//        .offset(y: offset)
//        .onAppear {
//            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 2).delay(Double(turns) * 0.333)) {
//                offset = 0
//            }
//        }
        .onChange(of: card) { newValue in
            if card == true {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 2)) {
                    offset = 500
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 2).delay(Double(turns) * 0.333)) {
                        offset = 0
                        print(turns)
                    }
                }                
            }
        }
        //
    }
}

//struct CardFlip: View {
//    var name: String = ""
//    var avatar: String = "M1"
//    var turns: Int = 1
//    @State var flipped: Bool = false
//    @State var rotationCard = 0.0
//    @State var rotationContent = 0.0
//    @State var duration = 1.0
//    var body: some View {
//        ZStack{
//            if flipped {
//                PlayerTurnCardView(name: name, avatar: avatar, turns: turns)
//            } else {
//                BackTurnCardView()
//            }
//        }
//        .onAppear(perform: flippingCard)
//        .rotation3DEffect(.degrees(rotationContent), axis: (0, 1, 0))
//        .rotation3DEffect(.degrees(rotationCard), axis: (0, 1, 0))
//    }
//
//    func flippingCard() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(turns) * 0.333)) {
//            withAnimation(.linear(duration: duration)) {
//                rotationCard += 180
//            }
//            withAnimation(.linear(duration: 0.0001).delay(duration / 2)) {
//                rotationContent += 180
//                DispatchQueue.main.asyncAfter(deadline: .now() + duration / 2) {
//                    flipped.toggle()
//                }
//            }
//        }
//    }
//}
//
//struct BackTurnCardView: View {
//
//    @State var offset: CGFloat = 400
//    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 12, style: .continuous)
//                .foregroundColor(.gray)
//                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
//        }//zstack
//        .frame(width: 96, height: 138)
//    }
//}


//struct PlayerTurnCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerTurnCardView()
//        //            BackTurnCardView()
//    }
//}

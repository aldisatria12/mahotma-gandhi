//
//  PlayerTurnCardView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 26/08/22.
//

import SwiftUI

struct PlayerTurnCardView: View {
    var name: String
    var avatar: String
    var turns: Int
    @State var offset: CGFloat = 400
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
            VStack{
                Text("\(turns)")
                    .padding(.init(top: 0, leading: 0, bottom: -2, trailing: 0))
                Image(avatar)
                    .resizable()
                    .frame(width: 72, height: 72)
                    .scaledToFit()
                    .clipShape(Circle())
                Text(name)
            }//vstack
            .padding(5)
        }//zstack
        .frame(width: 96, height: 128)
        .offset(x: offset)
        .onAppear {
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 2).delay(Double(turns) * 0.333)) {
                offset = 0
            }
        }
        
    }
}

struct PlayerTurnCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTurnCardView(name: "Test", avatar: "F1", turns: 1)
    }
}

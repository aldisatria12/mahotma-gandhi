//
//  CardPlayerInputView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct CardPlayerInputView: View {
    @Binding var selectedPlayer: PlayerModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
            VStack{
                Image("\(selectedPlayer.avatar)_Icon")
                    .resizable()
                    .frame(width: 100 / 390 * UIScreen.main.bounds.width, height: 100 / 844 * UIScreen.main.bounds.height)
                    .scaledToFit()
                    .clipShape(Circle())
                    
                TextField("Input your name", text: $selectedPlayer.name)
                    .padding()
                    .frame(width: 240 / 390 * UIScreen.main.bounds.width)
            }
        }
        .padding()
        .frame(height: 240 / 844 * UIScreen.main.bounds.height)
    }
}

struct CardPlayerInputView_Previews: PreviewProvider {
    static var previews: some View {
        CardPlayerInputView(selectedPlayer: .constant(PlayerModel(name: "", avatar: "M1")))
    }
}

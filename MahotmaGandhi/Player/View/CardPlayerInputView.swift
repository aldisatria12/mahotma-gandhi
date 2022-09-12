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
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .clipShape(Circle())
                    
                TextField("Input your name", text: $selectedPlayer.name)
                    .padding()
                    .frame(width: 240)
            }
        }
        .padding()
        .frame(height: 240)
    }
}

struct CardPlayerInputView_Previews: PreviewProvider {
    static var previews: some View {
        CardPlayerInputView(selectedPlayer: .constant(PlayerModel(name: "", avatar: "M1")))
    }
}

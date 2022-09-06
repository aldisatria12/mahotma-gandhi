//
//  CardPlayerMiniView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct CardPlayerMiniView: View {
    var name: String
    var avatar: String
    var selected: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(selected, lineWidth: 2))
            VStack{
                Image("\(avatar)_Icon")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .scaledToFit()
                    .clipShape(Circle())
                Text(name)
            }
            .padding(5)
        }
        .frame(width: 96, height: 128)
    }
}

struct CardPlayerMiniView_Previews: PreviewProvider {
    static var previews: some View {
        CardPlayerMiniView(name: "Test", avatar: "M1", selected: Color.black)
    }
}

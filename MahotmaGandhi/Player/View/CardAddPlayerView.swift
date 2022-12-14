//
//  CardAddPlayerView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct CardAddPlayerView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 2))
            VStack{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 72 / 390 * UIScreen.main.bounds.width, height: 72 / 844 * UIScreen.main.bounds.height)
                    .scaledToFit()
                    .clipShape(Circle())
                Text("Add player")
            }
            .padding(5)
        }
        .frame(width: 96 / 390 * UIScreen.main.bounds.width, height: 128 / 844 * UIScreen.main.bounds.height)
    }
}

struct CardAddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CardAddPlayerView()
    }
}

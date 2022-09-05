//
//  PauseMenuView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 26/08/22.
//

import SwiftUI

struct PauseMenuView: View {
    @Binding var closePauseMenu: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
            VStack {
                Text("PAUSED")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Button(action: {
                    closePauseMenu = false
                }, label: {
                    Text("RESUME")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(Color.gray
                            .cornerRadius(12)
                            .opacity(0.5))
                })
                Button(action: {
                    
                }, label: {
                    Text("MANAGE PLAYER")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(Color.gray
                            .cornerRadius(12)
                            .opacity(0.5))
                })
                Button(action: {
                    
                }, label: {
                    Text("MAIN MENU")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(Color.gray
                            .cornerRadius(12)
                            .opacity(0.5))
                })
            }
        }
        .frame(width: 220, height: 280, alignment: .center)
    }
}

//struct PauseMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        PauseMenuView()
//    }
//}

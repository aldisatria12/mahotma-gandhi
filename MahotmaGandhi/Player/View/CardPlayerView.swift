//
//  CardPlayerView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 08/09/22.
//

import SwiftUI

struct CardPlayerView: View {
    var body: some View {
        ZStack {
            Image("cardplayer")
                .frame(width: 155, height: 220, alignment: .center)
            VStack {
                PlayerAnimationWalkView()
                    .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("Player")
                    .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purple)
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.red)
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 25)
                        }
                    })
                }
                Spacer()
            }
        }
        .frame(width: 175, height: 240)
    }
}

struct AddPlayerView: View {
    var body: some View {
        ZStack {
            Image("card")
                .frame(width: 155, height: 220, alignment: .center)
            VStack {
                Button(action: {
                    
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.red)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                })
                Text("Add Player")
            }
        }
        .frame(width: 175, height: 240)
    }
}

//struct CardPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardPlayerView()
//    }
//}

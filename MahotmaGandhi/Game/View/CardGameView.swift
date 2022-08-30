//
//  CardGameView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 30/08/22.
//

import SwiftUI

struct CardGameView: View{
    @StateObject var vm : GameViewModel = GameViewModel()
    
    @State var flipped: Bool = false
    
    @State var degree = 0.0
    @State var content = 0.0
    
    var body: some View {
        ZStack {
            if flipped {
                ZStack (alignment: .topTrailing){
                    Image("BackgroundDescription")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    Button(action: {
                        tapFlipCard()
                    },label: {
                        Image(systemName: "chevron.backward.circle")
                            .foregroundColor(.black)
                            .frame(width: 45, height: 33, alignment: .bottomLeading)
                    })
                }
            } else {
                ZStack {
                    Image("BackgroundCard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    ZStack (alignment: .topTrailing){
                        Button(action: {
                            tapFlipCard()
                        },label: {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30, alignment: .bottomLeading)
                        })
                        VStack {
                            Text(vm.gameTitle)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                            Text(vm.gameQuestion)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(width: 250, height: 340, alignment: .center)
                        }
                    }
                }
            }
        }
        .rotation3DEffect(.degrees(content), axis: (x: 0, y:1, z:0))
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y:1, z:0))
    }
    
    func tapFlipCard() {
        let animationDuration = 1.0
        withAnimation(Animation.linear(duration: animationDuration)) {
            degree += 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
            content += 180
            flipped.toggle()
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}

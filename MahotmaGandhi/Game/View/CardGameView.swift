//
//  CardGameView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 30/08/22.
//

import SwiftUI

struct CardGameView: View{
    @State var flipped: Bool = false
    
    @State var degree = 0.0
    @State var content = 0.0
    
    //    @State var counter = 0
    
    var vm: GameViewModel
    
    @Binding var openCard: Bool
    
    var body: some View {
        ZStack (alignment: .center){
            if flipped {
                ZStack (alignment: .topTrailing){
                    Image(vm.cardHelpName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 325, height: 475, alignment: .center)
                    Button(action: {
                        tapFlipBack()
                    },label: {
                        Image(systemName: "chevron.backward.circle")
                            .resizable()
                            .scaledToFit()
                            .font(Font.title.weight(.semibold))
                            .background(yellow03)
                            .clipShape(Circle())
                            .foregroundColor(vm.baseColor)
                            .frame(width: 30, height: 30, alignment: .bottomLeading)
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                    })
                }
            } else {
                ZStack {
                    Image(vm.cardImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 325, height: 475, alignment: .center)
                    VStack {
                        Button(action: {
                            tapFlipCard()
                        },label: {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .scaledToFit()
                                .font(Font.title.weight(.semibold))
                                .background(yellow03)
                                .clipShape(Circle())
                                .foregroundColor(vm.baseColor)
                                .frame(width: 30, height: 30)
                                .position(x: 320, y: 120)
                        })
                        Text(vm.gameQuestion)
                            .font(.system(size: 31, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(earth01)
                            .multilineTextAlignment(.center)
                            .frame(width: 242, height: 299, alignment: .center)
                            .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        Button(action: {
                            openCard.toggle()
                            vm.animateMovement()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                vm.isChestShowed = true
                                vm.goToNextFloor()
                            }
                            //                                counter()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 21)
                                    .foregroundColor(ocean01)
                                Text("Next Floor")
                                    .font(.system(size: 25, design: .rounded))
                                    .fontWeight(.medium)
                                    .foregroundColor(yellow03)
                            }
                            .frame(width: 242, height: 41, alignment: .center)
                        }).padding(.init(top: 0, leading: 0, bottom: 110, trailing: 0))
                    }
                }
            }
        }
        .rotation3DEffect(.degrees(content), axis: (x: 0, y:1, z:0))
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y:1, z:0))
        .padding(.init(top: 0, leading: 0, bottom: 120, trailing: 0))
    }
    
    func tapFlipCard() {
        let animationDuration = 0.6
        withAnimation(Animation.linear(duration: animationDuration)) {
            degree += 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
            content += 180
            flipped.toggle()
        }
    }
    
    func tapFlipBack() {
        let animationDuration = 0.6
        withAnimation(Animation.linear(duration: animationDuration)) {
            degree -= 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
            content -= 180
            flipped.toggle()
        }
    }
}

//struct CardGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardGameView()
//    }
//}

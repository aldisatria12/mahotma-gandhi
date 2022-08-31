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
                    Image("BackgroundDescription")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    Button(action: {
                        tapFlipBack()
                    },label: {
                        Image(systemName: "chevron.backward.circle")
                            .foregroundColor(.black)
                            .frame(width: 45, height: 33, alignment: .bottomLeading)
                    })
                }
            } else {
                ZStack {
                    Image(vm.cardImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    VStack (){
                        HStack {
                            Spacer()
                            Button(action: {
                                tapFlipCard()
                            },label: {
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .font(Font.title.weight(.regular))
                                    .background(yellow03)
                                    .clipShape(Circle())
                                    .foregroundColor(vm.baseColor)
                                    .frame(width: 30, height: 30, alignment: .bottomLeading)
                                    .padding(.top, 20)
                                    .padding(.trailing, 20)
                            })
                        }
                        
                        VStack {
//                            Text(vm.gameTitle)
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//                                .padding(.init(top: 25, leading: 0, bottom: 0, trailing: 0))
                            Text(vm.gameQuestion)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(width: 240, height: 275, alignment: .center)
                            Button(action: {
                                openCard.toggle()
                                vm.animateMovement()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    vm.goToNextFloor()
                                }
//                                counter()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundColor(.gray)
                                    Text("Done")
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 200, height: 40, alignment: .center)
                            }).padding(.init(top: 0, leading: 0, bottom: 20, trailing: 0))
                            //if counter{PlayerAnimationView(counter:$counter)}
                        }
                    }
                }
            }
        }
        .rotation3DEffect(.degrees(content), axis: (x: 0, y:1, z:0))
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y:1, z:0))
        .frame(width: 280, height: 400)
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
    
    func tapFlipBack() {
        let animationDuration = 1.0
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

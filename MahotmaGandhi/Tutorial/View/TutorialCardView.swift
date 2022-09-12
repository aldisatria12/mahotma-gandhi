//
//  TutorialCardView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 08/09/22.
//

import SwiftUI

struct TutorialCardView: View {
    @State var flipped: Bool = false
    
    @State var degree = 0.0
    @State var content = 0.0
    
    //    @State var counter = 0
    
    var vm: TutorialViewModel
    
    
    @Binding var openCard: Bool
    
    var body: some View {
        ZStack (alignment: .center){
            if flipped {
                ZStack (alignment: .topTrailing){
                    Image("Card_TellATale_Guide")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    Button(action: {
                        vm.isCardFlipped.toggle()
                    },label: {
                        Image(systemName: "chevron.backward.circle")
                            .resizable()
                            .scaledToFit()
                            .font(Font.title.weight(.semibold))
                            .background(yellow03)
                            .clipShape(Circle())
                            .foregroundColor(red01)
                            .frame(width: 30, height: 30, alignment: .bottomLeading)
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                    })
                }
            } else {
                ZStack {
                    Image("Card_TellATale_Front")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 400, alignment: .center)
                    VStack (){
                        HStack {
                            Spacer()
                            Button(action: {
                                vm.isCardFlipped.toggle()
                            },label: {
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .font(Font.title.weight(.semibold))
                                    .background(yellow03)
                                    .clipShape(Circle())
                                    .foregroundColor(red01)
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
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(yellow01)
                                .multilineTextAlignment(.center)
                                .frame(width: 220, height: 275, alignment: .center)
                            Button(action: {
                                openCard.toggle()
                                vm.animateTutorialMovement()
                                //                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                //                                    vm.goToNextFloor()
                                //                                }
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundColor(blue01)
                                    Text("Next Floor")
                                        .font(.system(.title, design: .rounded))
                                        .fontWeight(.medium)
                                        .foregroundColor(yellow03)
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
        .onChange(of: vm.isCardFlipped) { newValue in
            let animationDuration = 0.75
            withAnimation(Animation.linear(duration: animationDuration)) {
                if vm.isCardFlipped {
                    degree -= 180
                } else {
                    degree += 180
                }
            }
            withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
                if vm.isCardFlipped {
                    content -= 180
                } else {
                    content += 180
                }
                flipped.toggle()
            }
        }
    }
    
    func tapFlipCard() {
        let animationDuration = 0.75
        withAnimation(Animation.linear(duration: animationDuration)) {
            degree += 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
            content += 180
            flipped.toggle()
        }
    }
    
    func tapFlipBack() {
        let animationDuration = 0.75
        withAnimation(Animation.linear(duration: animationDuration)) {
            degree -= 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationDuration/2)) {
            content -= 180
            flipped.toggle()
        }
    }
}

//struct TutorialCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialCardView(vm:TutorialViewModel(), openCard: <#Binding<Bool>#>)
//    }
//}

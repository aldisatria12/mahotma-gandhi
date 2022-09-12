//
//  TutorialItemView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 12/09/22.
//

import SwiftUI

struct TutorialItemView: View {
    
    @ObservedObject var tutorialVM : TutorialViewModel
    
    var body: some View {
        ZStack {
            if tutorialVM.tutorialState.0 == 0 && tutorialVM.tutorialState.1 == 1 {
                TutorialBottomMenuView(vm: tutorialVM, card: $tutorialVM.isCardOpen)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height) - (UIScreen.main.bounds.height * 129 / 844))
            } else if tutorialVM.tutorialState.0 == 0 && tutorialVM.tutorialState.1 == 2 {
                Button (action: {
                    tutorialVM.isCardOpen.toggle()
                    tutorialVM.changeTutorialState()
                    tutorialVM.getTutorialPointer()
                }, label: {
                    Image("Chest")
                        .resizable()
                        .scaledToFit()
                })
                .frame(width: UIScreen.main.bounds.width * 59 / 390, height: UIScreen.main.bounds.height * 80 / 844)
                .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 161 / 844))
            } else if tutorialVM.tutorialState.0 == 1 {
                Button(action: {
                    tutorialVM.isCardFlipped.toggle()
                    tutorialVM.changeTutorialState()
                    tutorialVM.getTutorialPointer()
                },label: {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.semibold))
                        .background(yellow03)
                        .clipShape(Circle())
                        .foregroundColor(red01)
                })
                .frame(width: 30, height: 30, alignment: .bottomLeading)
                .position(x: (UIScreen.main.bounds.width * 303 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) + 15)
            } else if tutorialVM.tutorialState.0 == 2 {
                Button(action: {
                    tutorialVM.isCardFlipped.toggle()
                    tutorialVM.changeTutorialState()
                    tutorialVM.getTutorialPointer()
                },label: {
                    Image(systemName: "chevron.backward.circle")
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.semibold))
                        .background(yellow03)
                        .clipShape(Circle())
                        .foregroundColor(red01)
                })
                .frame(width: 30, height: 30, alignment: .bottomLeading)
                .position(x: (UIScreen.main.bounds.width * 303 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) + 15)
            } else if tutorialVM.tutorialState.0 == 3 {
                Button(action: {
//                    openCard.toggle()
//                    vm.animateTutorialMovement()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(blue01)
                        Text("Next Floor")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(yellow03)
                    }
                })
                .frame(width: 200, height: 40, alignment: .center)
                .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 534 / 844) + 20)
//                .padding(.init(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    }
}

struct TutorialItemView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialItemView(tutorialVM: TutorialViewModel())
    }
}

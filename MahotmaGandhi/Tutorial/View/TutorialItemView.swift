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
            if tutorialVM.tutorialState.0 == 1 && tutorialVM.tutorialState.1 == 1 {
                TutorialBottomMenuView(vm: tutorialVM, card: $tutorialVM.isCardOpen)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height) - (UIScreen.main.bounds.height * 129 / 844) + 47)
                ArrowAnimationView(orientation: .down)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height) - (UIScreen.main.bounds.height * 129 * 2 / 844) + 60)
            } else if tutorialVM.tutorialState.0 == 0 {
                Button (action: {
                    if tutorialVM.isTextAnimated {
                        tutorialVM.getTutorialPointer()
                    } else {
                        tutorialVM.isCardOpen.toggle()
                        tutorialVM.changeTutorialState()
                        tutorialVM.getTutorialPointer()
                    }
                }, label: {
                    Image("Chest")
                        .resizable()
                        .scaledToFit()
                })
                .frame(width: UIScreen.main.bounds.width * 59 / 390, height: UIScreen.main.bounds.height * 80 / 844)
                .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 160 / 844) + (UIScreen.main.bounds.height * 80 * 0.5 / 844) + 5)
                ArrowAnimationView(orientation: .down)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 161 / 844) + (UIScreen.main.bounds.height * 40 / 844) - 30)
            } else if tutorialVM.tutorialState.0 == 1 {
                Button(action: {
                    if tutorialVM.isTextAnimated {
                        tutorialVM.getTutorialPointer()
                    } else {
                        tutorialVM.isTutorialPresented = false
                        tutorialVM.isCardFlipped.toggle()
                        tutorialVM.changeTutorialState()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            tutorialVM.isTutorialPresented = true
                            //// Mark : Tidak perlu karena sudah ada di onAppear
    //                        tutorialVM.getTutorialPointer()
                        }
                    }
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
                .position(x: (UIScreen.main.bounds.width * 306 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) + 15)
                ArrowAnimationView(orientation: .down)
                    .position(x: (UIScreen.main.bounds.width * 306 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) - 15)
            } else if tutorialVM.tutorialState.0 == 2 {
                Button(action: {
                    if tutorialVM.isTextAnimated {
                        tutorialVM.getTutorialPointer()
                    } else {
                        tutorialVM.isTutorialPresented = false
                        tutorialVM.isCardFlipped.toggle()
                        tutorialVM.changeTutorialState()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            tutorialVM.isTutorialPresented = true
    //                        tutorialVM.getTutorialPointer()
                        }
                    }
                    
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
                .position(x: (UIScreen.main.bounds.width * 306 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) + 15)
                ArrowAnimationView(orientation: .down)
                    .position(x: (UIScreen.main.bounds.width * 306 / 390) + 15, y: (UIScreen.main.bounds.height * 158 / 844) - 15)
            } else if tutorialVM.tutorialState.0 == 3 {
                Button(action: {
                    if tutorialVM.isTextAnimated {
                        tutorialVM.getTutorialPointer()
                    } else {
                        tutorialVM.isTutorialPresented = false
                        tutorialVM.isCardOpen.toggle()
                        tutorialVM.changeTutorialState()
                        tutorialVM.animateTutorialMovement()
                        tutorialVM.isMoving = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            tutorialVM.isMoving = false
                            tutorialVM.isTutorialPresented = true
                        }
                    }
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
                .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 534 / 844) + 12)
                ArrowAnimationView(orientation: .down)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 534 / 844) - 22)
//                .padding(.init(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        .ignoresSafeArea()
    }
}

struct TutorialItemView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialItemView(tutorialVM: TutorialViewModel())
    }
}

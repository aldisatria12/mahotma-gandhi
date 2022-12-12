//
//  TutorialPointerView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 09/09/22.
//

import SwiftUI

struct TutorialPointerView: View {
    
    @ObservedObject var tutorialVM : TutorialViewModel
    
    var body: some View {
//
        TimelineView(.animation(minimumInterval: 0.05, paused: !tutorialVM.isTextAnimated)) { timeline in
            ZStack {
                TutorialCoverView()
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            NavigationUtil.popToRootView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width:75 / 390 * UIScreen.main.bounds.width, height:35 / 844 * UIScreen.main.bounds.height)
                                    .foregroundColor(yellow02)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(blue01, lineWidth : 2)
                                    )
                                Text("Skip")
                                    .foregroundColor(blue01)
                            }
                        }
                        .padding(.trailing, 25)
                        .padding(.top, 50)
                    }
                    Spacer()
                }
                if tutorialVM.isTutorialItemShowed {
                    TutorialItemView(tutorialVM: tutorialVM)
                }
                TutorialDialogCardView(tutorialVM: tutorialVM, date: timeline.date)
                    .position(x: UIScreen.main.bounds.width / 2, y: tutorialVM.isTutorialItemShowed && tutorialVM.tutorialState.0 == 3 ? (UIScreen.main.bounds.height * 300 / 844) + (UIScreen.main.bounds.height * 194 * 0.5 / 844) : (UIScreen.main.bounds.height * 437 / 844) + (UIScreen.main.bounds.height * 194 * 0.5 / 844))
            } //ZStack
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            
            
        } // TimelineView
        .onAppear() {
            tutorialVM.getTutorialPointer()
        }
        .onTapGesture {
            tutorialVM.getTutorialPointer()
        }
    }
}

struct TutorialPointerView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPointerView(tutorialVM: TutorialViewModel())
    }
}

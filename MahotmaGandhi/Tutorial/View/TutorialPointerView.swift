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
                                    .frame(width:75, height:35)
                                    .foregroundColor(yellow02)
                                Text("Skip")
                                    .foregroundColor(blue01)
                            }
                        }
                        .padding(.trailing, 25)
                    }
                    Spacer()
                }
                if tutorialVM.isTutorialItemShowed {
                    TutorialItemView(tutorialVM: tutorialVM)
                }
                TutorialDialogCardView(tutorialVM: tutorialVM, date: timeline.date)
                    .position(x: UIScreen.main.bounds.width / 2, y: tutorialVM.isTutorialItemShowed && tutorialVM.tutorialState.0 == 3 ? (UIScreen.main.bounds.height * 250 / 844) + (UIScreen.main.bounds.height * 194 * 0.5 / 844) : (UIScreen.main.bounds.height * 387 / 844) + (UIScreen.main.bounds.height * 194 * 0.5 / 844))
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

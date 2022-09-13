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
                if tutorialVM.isTutorialItemShowed {
                    TutorialItemView(tutorialVM: tutorialVM)
                }
                TutorialDialogCardView(tutorialVM: tutorialVM, date: timeline.date)
                    .position(x: UIScreen.main.bounds.width / 2, y: tutorialVM.isTutorialItemShowed && tutorialVM.tutorialState.0 == 3 ? (UIScreen.main.bounds.height * 349 / 844) + (UIScreen.main.bounds.height * 141 * 0.5 / 844) : (UIScreen.main.bounds.height * 492 / 844) + (UIScreen.main.bounds.height * 141 * 0.5 / 844))
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

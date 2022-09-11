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
        TimelineView(.animation(minimumInterval: 0.01, paused: !tutorialVM.isTextAnimated)) { timeline in
            ZStack {
                TutorialCoverView()
                TutorialDialogCardView(tutorialVM: tutorialVM, date: timeline.date)
                    .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 498 / 844) + (0.5 *  UIScreen.main.bounds.height * 139 / 844))
            } //ZStack
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

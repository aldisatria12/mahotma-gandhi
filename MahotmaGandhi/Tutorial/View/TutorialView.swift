//
//  TutorialView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 07/09/22.
//

import SwiftUI

struct TutorialView: View {
    
    @StateObject var tutorialVM = TutorialViewModel()
    
    
    var body: some View {
        ZStack {
            ZStack {
                TutorialFloorView(tutorialVM: tutorialVM, keyFrameIndex: tutorialVM.tutorialCounter[0] ?? 0)
                TutorialFloorView(tutorialVM: tutorialVM, keyFrameIndex: tutorialVM.tutorialCounter[1] ?? 1)
            }
            VStack {
                ZStack {
                    ForEach(0..<tutorialVM.dummyPlayers.count, id: \.self) { i in
                        if tutorialVM.isMoving {
                            WalkView()
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))

                        } else {
                            IdleView()
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.242 + UIScreen.main.bounds.height * 0.059)
                                .offset(y: CGFloat(i * 62))
                        }
                    } // ForEach
                } // ZStack
                
            } // VStack
            ZStack {
                TutorialAnimationView(keyFrameIndex: tutorialVM.tutorialCounter[0] ?? 0)
                TutorialAnimationView(keyFrameIndex: tutorialVM.tutorialCounter[1] ?? 1)
            }
            VStack {
                if tutorialVM.isTopMenuShowed {
                    TutorialTopMenuView()
                }
                Spacer()
                TutorialBottomMenuView(vm: tutorialVM ,card: $tutorialVM.isCardOpen)
                    .offset(y: 38)
            } // VStack
            if tutorialVM.isCardOpen {
                TutorialCardView(vm: tutorialVM, openCard: $tutorialVM.isCardOpen)
            }
            if tutorialVM.isTutorialPresented {
                TutorialCoverView()
            }
        } // ZStack Pertama
        .navigationBarHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}

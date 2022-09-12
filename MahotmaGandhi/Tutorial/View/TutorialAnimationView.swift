//
//  TutorialAnimationView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 07/09/22.
//

import SwiftUI

struct TutorialAnimationView: View {
    var keyFrameIndex : Int
    
//    @ObservedObject var tutorialVM : TutorialViewModel
    
    // Gerak ke atas
    let keyFrames = [

        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * -0.5) - 47, animation: nil),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 0.5) - 47, animation: .linear(duration: 3)),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 1.5) - 47, animation:  .linear(duration: 3)),
    ]
    
//    let keyFrames = [
//
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 1.5) - 47, animation:  nil),
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 0.5) - 47, animation: .linear(duration: 3)),
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * -0.5) - 47, animation: .linear(duration: 3)),
//    ]
    
    var body: some View {
        VStack {
            Image("stage_top")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.127)
            Spacer()
            Image("stage_bottom")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.043)
        } // VStack
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 671 / 844)
        .modifier(Effects(keyframe: keyFrames[keyFrameIndex]))
        .animation(keyFrames[keyFrameIndex].animation, value: keyFrameIndex)
        .onChange(of: keyFrameIndex) {_ in
            advanceKeyFrame()
        }
        .onAppear { advanceKeyFrame()}
    }
    
    func advanceKeyFrame() {
        // function kosong
        print("")
    }
    
    struct Effects: ViewModifier {
        let keyframe: KeyFrame
        
        func body(content: Content) -> some View {
            content
                .position(x:UIScreen.main.bounds.width / 2 ,y: keyframe.y)
        }
    }
}

struct TutorialAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAnimationView(keyFrameIndex: 1)
    }
}

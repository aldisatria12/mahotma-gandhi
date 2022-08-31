//
//  TopAnimationView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 30/08/22.
//

import SwiftUI

struct TopAnimationView: View {
    var keyFrameIndex : Int
    //animation ke atas
    let keyFrames = [

        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * -0.921) - 47, animation: nil),
        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * 0.079) - 47, animation: .linear(duration: 3)),
        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * 1.079) - 47, animation:  .linear(duration: 3)),
    ]
//    let keyFrames = [
//
//        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * 1.079) - 47, animation: nil),
//        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * 0.079) - 47, animation: .linear(duration: 3)),
//        KeyFrame(y: (UIScreen.main.bounds.height * 0.796 * -0.921) - 47, animation:  .linear(duration: 3)),
//        ]
    
    var body: some View {
        Image("Top1")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.127)
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

struct TopAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TopAnimationView(keyFrameIndex: 1)
    }
}

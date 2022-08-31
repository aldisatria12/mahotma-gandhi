//
//  FloorView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 29/08/22.
//

import SwiftUI

struct FloorView: View {
    
    var keyFrameIndex : Int
    // Gerak ke atas
//    let keyFrames = [
//
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * -0.5) - 47, animation: nil),
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 0.5) - 47, animation: .linear(duration: 3)),
//        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 1.5) - 47, animation:  .linear(duration: 3)),
//    ]
    
    let keyFrames = [
        
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 1.5) - 47, animation:  nil),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 0.5) - 47, animation: .linear(duration: 3)),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * -0.5) - 47, animation: .linear(duration: 3)),
    ]
    
    var body: some View {
        ZStack {
            Image("stage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 671 / 844)
                .modifier(Effects(keyframe: keyFrames[keyFrameIndex]))
                .animation(keyFrames[keyFrameIndex].animation, value: keyFrameIndex)
                .onChange(of: keyFrameIndex) {_ in
                    advanceKeyFrame()
                }
                .onAppear { advanceKeyFrame()}
        }
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

struct FloorView_Previews: PreviewProvider {
    static var previews: some View {
        FloorView(keyFrameIndex: 1)
    }
}

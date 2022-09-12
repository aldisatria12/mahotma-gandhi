//
//  AnimationView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 05/09/22.
//

import SwiftUI

struct AnimationView: View {
    
    var keyFrameIndex : Int
    let id : Int
    
    @ObservedObject var gameVM : GameViewModel
    
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

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(keyFrameIndex: 1, id: 1, gameVM: GameViewModel(players: []))
    }
}

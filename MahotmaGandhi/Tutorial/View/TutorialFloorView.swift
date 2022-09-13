//
//  TutorialFloorView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 06/09/22.
//

import SwiftUI

struct TutorialFloorView: View {
    
    @ObservedObject var tutorialVM : TutorialViewModel
    
    
    let keyFrameIndex : Int
    
    let keyFrames = [
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * -0.5) - 47, animation: nil),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 0.5) - 47, animation: .linear(duration: 3)),
        KeyFrame(y: (UIScreen.main.bounds.height * 671 / 844 * 1.5) - 47, animation:  .linear(duration: 3)),
    ]
    
    var body: some View {
        ZStack {
            Image("stage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 671 / 844)
            Button (action: {
                tutorialVM.isCardOpen.toggle()
            }, label: {
                Image("Chest")
                    .resizable()
                    .scaledToFit()
            })
            .frame(width: UIScreen.main.bounds.width * 59 / 390, height: UIScreen.main.bounds.height * 80 / 844)
            .position(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height * 161 / 671) + (UIScreen.main.bounds.height * 40 / 671 ))
            .disabled(true)
        }// ZStack Pertama
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 671 / 844)
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

struct TutorialFloorView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFloorView(tutorialVM: TutorialViewModel(), keyFrameIndex: 1)
    }
}

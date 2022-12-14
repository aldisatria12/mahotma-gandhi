//
//  FloorView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 29/08/22.
//

import SwiftUI

struct FloorView: View {
    
    let id : Int
    var keyFrameIndex : Int
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
        ZStack {
            Image(gameVM.floorImageIndex[id] ?? "")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 671 / 844)
            Button (action: {
                gameVM.isCardOpen.toggle()
            }, label: {
                Image(gameVM.mainCounter[id] != 2 ? "Chest" : "")
                    .resizable()
                    .scaledToFit()
            })
            .frame(width: UIScreen.main.bounds.width * 81 / 390, height: UIScreen.main.bounds.height * 111 / 844)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 240 / 844)
            
            
        }// ZStack Pertama
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

struct FloorView_Previews: PreviewProvider {
    static var previews: some View {
        FloorView(id: 0, keyFrameIndex: 1, gameVM: GameViewModel(players: []))
    }
}

//
//  PlayerAnimationView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 30/08/22.
//

import SwiftUI

struct PlayerAnimationView: View {
    @State var imageFrame: String = ""
    @Binding var player: PlayerModel
    
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var counter = 0
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
                    if counter == 118 {
//                        imageFrame = "Wayfarer_Idle\(index)"
                        imageFrame = "\(player.avatar)_Idle_\(index)"
                    } else {
                        self.counter += 1
//                        imageFrame = "Wayfarer\(index)"
                        imageFrame = "\(player.avatar)_Walk_\(index)"
                    }
                    index += 1
                    if counter == 118 {
                        if (index > 117) {
                            index = 0
                        }
                    } else {
                        if (index > 58) {
                            index = 0
                        }
                    }
                }
        }
    }
}

struct PlayerAnimationWalkView: View {
    @State var imageFrame: String = ""
    
    @Binding var player: PlayerModel
    @Binding var stopTimer:Bool
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
                    
                    imageFrame = "\(player.avatar)_Walking_\(index)"
                    index += 1
                    if (index > 58) {
                        index = 0
                    }
                }
//                .onReceive(stopTimer) { _ in
//                    timer.upstream.connect().cancel()
//                }
        }.onChange(of: stopTimer) { _ in
            if stopTimer == true{
            timer.upstream.connect().cancel()
            }
        }
    }
    
}

struct PlayerAnimationIdleView: View {
    @State var imageFrame: String = ""
    
    @Binding var player: PlayerModel
    @Binding var stopTimer:Bool
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
//                    imageFrame = "Guardian_Idle_\(index)"
                    imageFrame = "\(player.avatar)_Idle_\(index)"
                    index += 1
                    if (index > 117) {
                        index = 0
                    }
                }
        }.onChange(of: stopTimer) { _ in
            if stopTimer == true{
            timer.upstream.connect().cancel()
            }
        }
    }
}

//struct PlayerAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerAnimationView()
//    }
//}

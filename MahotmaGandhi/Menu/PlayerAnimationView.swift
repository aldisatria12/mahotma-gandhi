//
//  PlayerAnimationView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 30/08/22.
//

import SwiftUI

struct PlayerAnimationView: View {
    @State var imageFrame: String = ""
    
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var counter = 0
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
                    if counter == 118 {
                        imageFrame = "Wayfarer_Idle\(index)"
                    } else {
                        self.counter += 1
                        imageFrame = "Wayfarer\(index)"
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
    
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
                    imageFrame = "Wayfarer\(index)"
                    index += 1
                    if (index > 58) {
                        index = 0
                    }
                }
        }
    }
    
}

struct PlayerAnimationIdleView: View {
    @State var imageFrame: String = ""
    
    let timer = Timer.publish(every: 0.033, on: .main, in: .common).autoconnect()
    @State var index = 0
    var body: some View {
        VStack {
            Image(imageFrame)
                .onReceive(timer) { _ in
                    imageFrame = "Wayfarer_Idle\(index)"
                    index += 1
                    if (index > 117) {
                        index = 0
                    }
                }
        }
    }
}

//struct PlayerAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerAnimationView()
//    }
//}

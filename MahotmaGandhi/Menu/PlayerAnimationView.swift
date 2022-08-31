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
                        imageFrame = "Wayfarer_Idle\(index)"
//                        imageFrame = "\(player.avatar)_Idle\(index)"
                    } else {
                        self.counter += 1
                        imageFrame = "Wayfarer\(index)"
//                        imageFrame = "\(player.avatar,index)"
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

struct PlayerAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerAnimationView(player: .constant(PlayerModel(name: "Atest", avatar: "M1")))
    }
}

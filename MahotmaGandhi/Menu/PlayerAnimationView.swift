//
//  PlayerAnimationView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 30/08/22.
//

import SwiftUI

struct PlayerAnimationView: View {
    @State var imageFrame: String = ""
    
    var body: some View {
        VStack {
            Image(imageFrame)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.179, height: UIScreen.main.bounds.height * 0.118)
                .onAppear(perform: timerImage)
        }
    }
    
    func timerImage() {
        var index = 1
        let timer = Timer.scheduledTimer(withTimeInterval: 0.032, repeats: true) { (Timer) in
            imageFrame = "Wayfarer\(index)"
            index += 1
            
            if (index > 58) {
                index = 1
            }
        }
    }
}

struct PlayerAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerAnimationView()
    }
}

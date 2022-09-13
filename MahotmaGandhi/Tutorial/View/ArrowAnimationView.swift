//
//  ArrowAnimationView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 08/09/22.
//

import SwiftUI

struct ArrowAnimationView: View {
    @State var offsetx: CGFloat = 0
    @State var offsety: CGFloat = 0
    
    @State var animation: Bool = true
    
    var orientation : Orientation
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Image(systemName: "arrowtriangle.\(orientation.imageType).fill")
                .resizable()
                .frame(width: 25, height: 30)
                .foregroundColor(yellow02)
                .offset(x: offsetx, y: offsety)
                .onReceive(timer) { _ in
                    animation.toggle()
                    withAnimation {
                        if orientation.vertical {
                            if animation{
                                offsety = -5
                            } else {
                                offsety = 5
                            }
                            
                        } else {
                            if animation{
                                offsetx = -5
                            } else {
                                offsetx = 5
                            }
                        }
                    }
                }
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
}

struct ArrowAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowAnimationView(orientation: .down)
    }
}

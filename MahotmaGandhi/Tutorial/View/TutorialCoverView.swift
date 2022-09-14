//
//  TutorialCoverView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 08/09/22.
//

import SwiftUI

struct TutorialCoverView: View {
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .foregroundColor(black01)
            .opacity(0.5)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    }
}

struct TutorialCoverView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCoverView()
    }
}

//
//  TutorialDialogCardView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 09/09/22.
//

import SwiftUI

struct TutorialDialogCardView: View {
    
    var tutorialText : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(yellow03)
                .cornerRadius(25)
            VStack {
                Text(tutorialText)
                    .padding([.top])
                    .frame(width: (UIScreen.main.bounds.width * 324 / 392) - 20, height: (UIScreen.main.bounds.height * 139 / 844) - 20, alignment: .topLeading)
                Spacer()
                HStack {
                    Spacer()
                    Text("...")
                        .padding([.trailing, .bottom])
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 324 / 392, height: UIScreen.main.bounds.height * 139 / 844)
    }
}

struct TutorialDialogCardView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDialogCardView(tutorialText: "Trial")
    }
}

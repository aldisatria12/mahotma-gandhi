//
//  TutorialDialogCardView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 09/09/22.
//

import SwiftUI

struct TutorialDialogCardView: View {
    
    @ObservedObject var tutorialVM : TutorialViewModel
    
    let date : Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(yellow03)
                .cornerRadius(25)
            VStack {
                Text(tutorialVM.tutorialPointerText)
                    .padding([.top])
                    .frame(width: (UIScreen.main.bounds.width * 324 / 392) - 20, height: (UIScreen.main.bounds.height * 139 / 844) - 20, alignment: .topLeading)
                    .onChange(of: date) { _ in
                        tutorialVM.animateTextAppearance()
                    }
                
                Spacer()
                HStack {
                    Spacer()
                    Text("...")
                        .padding([.trailing, .bottom])
//                        .animation(.spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0), value: tutorialVM.isDotsUp)
//                        .onChange(of: tutorialVM.isDotsUp) { _ in
//                            if tutorialVM.isDotsUp == true {
//                                tutorialVM.isDotsUp = false
//                            }
//                        }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 324 / 392, height: UIScreen.main.bounds.height * 139 / 844)
    }
}

struct TutorialDialogCardView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDialogCardView(tutorialVM: TutorialViewModel(), date: Date())
    }
}

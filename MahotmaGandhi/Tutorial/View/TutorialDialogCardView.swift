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
            Image("DialogBox")
                .frame(width: UIScreen.main.bounds.width * 324 / 392, height: UIScreen.main.bounds.height * 141 / 844)
//                
            VStack {
                Text(tutorialVM.tutorialPointerText)
//                    .padding(.top, 34)
//                    .padding(.leading, 31)
//                    .padding(.trailing, 25)
                    .frame(width: (UIScreen.main.bounds.width * 268 / 392),  height: (UIScreen.main.bounds.height * 67 / 844), alignment: .topLeading)
                    .offset(x: 5, y: 25)
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
        .frame(width: UIScreen.main.bounds.width * 324 / 392, height: UIScreen.main.bounds.height * 141 / 844)
    }
}

struct TutorialDialogCardView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDialogCardView(tutorialVM: TutorialViewModel(), date: Date())
    }
}

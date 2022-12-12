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
            VStack {
                Spacer()
                ZStack {
                    Image("DialogBox")
                        .frame(width: UIScreen.main.bounds.width * 324 / 392, height: UIScreen.main.bounds.height * 141 / 844)
                    //
                    VStack {
                        Text(tutorialVM.tutorialPointerText)
                        //                    .padding(.top, 34)
                        //                    .padding(.leading, 31)
                        //                    .padding(.trailing, 25)
                            .font(.system(size: 17, design:.rounded))
                            .fontWeight(.bold)
                            .foregroundColor(blue01)
                            .frame(width: (UIScreen.main.bounds.width * 268 / 390),  height: (UIScreen.main.bounds.height * 97 / 844), alignment: .topLeading)
                            .offset(x: 5, y: 25)
                            .onChange(of: date) { _ in
                                tutorialVM.animateTextAppearance()
                            }
                        
                        Spacer()
                        HStack {
                            Spacer()
                            if tutorialVM.isTextAnimated == false && (tutorialVM.tutorialState.1 != tutorialVM.tutorialPointer[tutorialVM.tutorialState.0]!.count - 1 || tutorialVM.tutorialState.0 == 4) {
                                Text(". . .")
                                    .font(.system(size: 30, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(blue01)
                                    .frame(width: 31 / 390 * UIScreen.main.bounds.width, height: 12 / 844 * UIScreen.main.bounds.height, alignment: .bottom)
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 20)
                                    .offset(x: 0, y: tutorialVM.isDotsUp ? -5 : 5)
                                    .animation(.spring(response: 0.55, dampingFraction: 0.45, blendDuration: 0), value: tutorialVM.isDotsUp)
                                    .onChange(of: tutorialVM.isDotsUp) { _ in
                                        if tutorialVM.isDotsUp == true {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                tutorialVM.isDotsUp = false
                                            }
                                        }
                                    }
                            }
                            
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 324 / 390, height: UIScreen.main.bounds.height * 141 / 844)
            }
            VStack {
                HStack() {
                    Image("Sage_Icon")
                        .resizable()
                        .frame(width: 82 / 390 * UIScreen.main.bounds.width, height: 82 / 844 * UIScreen.main.bounds.height)
                    Spacer()
                }
                Spacer()
            } // VStack
        } // ZStack
        .frame(width: UIScreen.main.bounds.width * 324 / 390, height: UIScreen.main.bounds.height * 194 / 844)
    }
    
}

struct TutorialDialogCardView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDialogCardView(tutorialVM: TutorialViewModel(), date: Date())
    }
}

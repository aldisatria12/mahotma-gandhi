//
//  MainMenuView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 05/09/22.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("MainMenu_Background")
                    .ignoresSafeArea()
                VStack {
                    Image("MainMenu_Title")
                    NavigationLink(destination: {
                        AllPlayerView()
                    }, label: {
                        Text("Play")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(yellow03)
                            .background(ocean01
                                .cornerRadius(40)
                                .frame(width: 216 / 390 * UIScreen.main.bounds.width, height: 54 / 844 * UIScreen.main.bounds.height, alignment: .center))
                    })
                    .frame(width: 216 / 390 * UIScreen.main.bounds.width, height: 54 / 844 * UIScreen.main.bounds.height)
                    .padding(.init(top: 40, leading: 0, bottom: 0, trailing: 0))
                    NavigationLink {
                        TutorialView()
                    } label: {
                        Text("Tutorial")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(yellow03)
                            .background(ocean01
                                .cornerRadius(40)
                                .frame(width: 216 / 390 * UIScreen.main.bounds.width, height: 54 / 844 * UIScreen.main.bounds.height, alignment: .center))
                    }
                    .frame(width: 216 / 390 * UIScreen.main.bounds.width, height: 54 / 844 * UIScreen.main.bounds.height)
                    .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                } // VStack
            } // ZStack
        } // Navigation Link
    }
}

//struct MainMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenuView()
//    }
//}

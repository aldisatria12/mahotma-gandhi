//
//  MainMenuView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 05/09/22.
//

import SwiftUI

struct MainMenuView: View {
    @StateObject var playerViewModel = PlayerViewModel()
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: {
                    PlayerView(playerViewModel: playerViewModel)
                }, label: {
                    Image(systemName: "play.circle")
                })
                NavigationLink {
                    TutorialView()
                } label: {
                    Text("Tutorial")
                }

            } // VStack
        } // Navigation Link
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

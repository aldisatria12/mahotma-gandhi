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
            NavigationLink(destination: {
                PlayerView(playerViewModel: playerViewModel)
            }, label: {
                Image(systemName: "play.circle")
            })
            
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

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
            NavigationLink(destination: {
                AllPlayerView()
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

//
//  ContentView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainMenuView()
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AllPlayerView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 08/09/22.
//

import SwiftUI

struct AllPlayerView: View {
    @StateObject var playerViewModel = PlayerViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        ZStack {
            Image("CreateParty_Background")
                .ignoresSafeArea()
            VStack{
                Rectangle().frame(height: 29)
                    .foregroundColor(.clear)
                AllPlayerNavBarView()
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer().frame(height: (UIScreen.main.bounds.height * 89 / 844) + 15)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0 ..< 6) { i in
                        if playerViewModel.allPlayer.count == i {
                            AddPlayerView()
                        } else if i < playerViewModel.allPlayer.count {
                            CardPlayerView(selectedPlayer: $playerViewModel.selectedPlayer)
                        } else {
                            BlankView()
                        }
                        
                        //                    CardPlayerView()
                    }
                }.padding(.horizontal)
            }
            //            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}



//struct AllPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPlayerView()
//    }
//}

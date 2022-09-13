//
//  AllPlayerNavBarView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 08/09/22.
//

import SwiftUI

struct AllPlayerNavBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var allPlayers: [PlayerModel]
    var body: some View {
        ZStack{
            Image("CreateParty_NavBar")
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill").imageScale(.large)
                            .foregroundColor(blue03)
                            .padding(.leading)
                    }
                    
                    Spacer()
                    NavigationLink {
                        GameView(vm: GameViewModel(players: allPlayers))
                    } label: {
                        Text("Start")
                            .frame(width: UIScreen.main.bounds.width * 64 / 390, height: UIScreen.main.bounds.height * 36 / 844)
                            .background(yellow02)
                            .foregroundColor(blue01)
                            .clipShape(RoundedRectangle(cornerRadius: 36))
                            .padding(.trailing)
                    }
                }
                Text("\(allPlayers.count) / 6")
                    .offset(y: 9)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 89 / 844)
        
    }
}

//struct AllPlayerNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPlayerNavBarView()
//    }
//}

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
                        ZStack{
                            Circle()
                                .foregroundColor(blue01)
                                .frame(width: 32 / 390 * UIScreen.main.bounds.width, height: 32 / 844 * UIScreen.main.bounds.height)
                            Circle()
                                .foregroundColor(blue03)
                                .frame(width: 26 / 390 * UIScreen.main.bounds.width, height: 26 / 844 * UIScreen.main.bounds.height)
                            Image(systemName: "lessthan")
                                .font(.system(size: 14, weight: .black, design: .rounded))
                                .foregroundColor(blue01)
                                .frame(width: 13 / 390 * UIScreen.main.bounds.width, height: 17 / 844 * UIScreen.main.bounds.height, alignment: .center)
                        }
                    }
                    .frame(width: 32 / 390 * UIScreen.main.bounds.width, height: 32 / 844 * UIScreen.main.bounds.height)
                    .padding(.leading)
                    
                    Spacer()
                    if allPlayers.count > 0 {
                        NavigationLink {
                            GameView(vm: GameViewModel(players: allPlayers))
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: UIScreen.main.bounds.width * 64 / 390, height: UIScreen.main.bounds.height * 36 / 844)
                                    .foregroundColor(blue01)
                                Text("Start")
                                    .font(.system(size: 16, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(width: UIScreen.main.bounds.width * 58 / 390, height: UIScreen.main.bounds.height * 30 / 844)
                                    .background(yellow02)
                                    .foregroundColor(blue01)
                                    .clipShape(RoundedRectangle(cornerRadius: 36))
                            }
                        }
                        .padding(.trailing)                        
                    }
                }
                Text("\(allPlayers.count) / 6")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(blue01)
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

//
//  AllPlayerNavBarView.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 08/09/22.
//

import SwiftUI

struct AllPlayerNavBarView: View {
    var body: some View {
        HStack{
            Image("CreateParty_NavBar")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 89 / 844)
        
    }
}

struct AllPlayerNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AllPlayerNavBarView()
    }
}

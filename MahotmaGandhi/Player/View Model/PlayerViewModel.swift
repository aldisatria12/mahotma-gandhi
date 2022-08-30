//
//  PlayerViewModel.swift
//  MahotmaGandhi
//
//  Created by Aldi Mahotma on 24/08/22.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var allPlayer = [PlayerModel(name: "", avatar: "M1")]
    @Published var selectedPlayer: Int = 0
    @Published var avatarName = ["M1","M2","M3","M4","F1","F2","F3","F4"]
}


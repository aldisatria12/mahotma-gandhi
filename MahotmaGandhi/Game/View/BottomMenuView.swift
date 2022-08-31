//
//  BottomMenuView.swift
//  MahotmaGandhi
//
//  Created by Terrence Pramono on 30/08/22.
//

import SwiftUI

struct BottomMenuView: View {
    
    @ObservedObject var vm : GameViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button("Next Floor") {
                vm.animateMovement()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    vm.goToNextFloor()
                }
            }
            .padding([.horizontal], UIScreen.main.bounds.width / 2 - 50)
            .padding(.vertical)
        
            .border(.gray)
            .background(.gray)
            .padding(.bottom)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.12)
        .background(.blue)
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView(vm: GameViewModel())
    }
}

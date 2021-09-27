//
//  BoardView.swift
//  ColorMixer
//
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var colorGuesser : ColorGuess
    
    var body: some View {
        Rectangle()
            .fill(Color(colorGuesser.currColor))
            .frame(width: 300, height: 400)
            .cornerRadius(50)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .animation(Animation.easeIn)
        }
}

//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView()
//    }
//}

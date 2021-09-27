//
//  OverView.swift
//  ColorMixer
//
//

import SwiftUI

struct OverView: View {
    
    @EnvironmentObject var colorGuesser: ColorGuess
    @State private var isVisible: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.black)
                .opacity(0.2))
                .blur(radius: 50)
            Rectangle()
                .fill(Color(.white))
                .frame(width: 320, height: 240)
                .cornerRadius(30)
                .shadow(radius: 10)
            ZStack {
                Rectangle()
                    .fill(Color(.red))
                    .frame(width: 300, height: 60)
                    .cornerRadius(20)
                    .onTapGesture {
                        colorGuesser.newgame()
                        isVisible = false
                    }
                    
                Text("Try Again")
                    .bold()
                    .foregroundColor(.white)
            }.frame(height: 220, alignment: .bottom)
            VStack {
                Text("Game Over!\n").font(.title).bold()
                Text("Final Score: \(colorGuesser.score)").font(.title)
                Spacer()
            }.frame(width: 260, height: 180, alignment: .center)
        }
        .opacity(isVisible ? 1 : 0)
        .onAppear() {
            withAnimation(.spring()) {
                isVisible = true
            }
        }
    }
}

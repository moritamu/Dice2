//
//  ContentView.swift
//  Dice2
//  https://ios-docs.dev/swiftui-part6/
//  Created by MsMacM on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = 1
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button(action: {
                print("ボタンが押された")
                randomNumber = Int.random(in: 1...6)
            }) {
                Text("サイコロを振る")
                    .padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

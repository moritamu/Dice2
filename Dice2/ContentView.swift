//
//  ContentView.swift
//  Dice2
//  https://ios-docs.dev/swiftui-part6/
//  Created by MsMacM on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    @State var randomNumber = 1
    @State var timer: Timer?
    @State var isRolling = false
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
//            ここでエラーが出ている
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button(action: {
                print("ボタンが押された")
                isRolling = true
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in randomNumber = Int.random(in: 1...6)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    timer?.invalidate()
                    timer = nil
                    isRolling = false
                }
            }) {
                Text("サイコロを振る")
                    .padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.largeTitle)
            }
            .disabled(isRolling)
            Spacer()
        }
    }
    func playDice() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

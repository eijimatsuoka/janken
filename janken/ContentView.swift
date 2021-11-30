

import SwiftUI

struct ContentView: View {
    @State private var playerHand = 0
    @State private var computerHand = 0
    @State private var text = "じゃんけん"
    var body: some View {
        VStack {
            
            /** 顔 */
            Image("face")
                .resizable()
                .scaledToFit()
            
            /** 相手の手 */
            if(computerHand == 0) {
                Image("gu")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            if(computerHand == 1) {
                Image("tyoki")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            if(computerHand == 2) {
                Image("pa")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            
            /** 文字 */
            Text(text)
                .font(.title)
            
            /** 自分の手 */
            if(playerHand == 0) {
                Image("gu")
                    .resizable()
                    .scaledToFit()
            } else if(playerHand == 1) {
                Image("tyoki")
                    .resizable()
                    .scaledToFit()
            } else if(playerHand == 2) {
                Image("pa")
                   .resizable()
                   .scaledToFit()
            }
            
            /** ボタン */
            HStack {
                Button(action: {
                    print("グー")
                    self.playerHand = 0;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("gu")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    print("チョキ")
                    self.playerHand = 1;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("tyoki")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    print("パー")
                    self.playerHand = 2;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("pa")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
 
func chooseComputerHand() -> Int {
    let random = Int.random(in: 0...2)
    let computerHand = random
    return computerHand
}

func determineVictoryOrDefeat(playerHand:Int, computerHand:Int) -> String {
    var result = ""
    var playerHandTemp = playerHand
    playerHandTemp+=1
 
    if (playerHand == computerHand) {
        result = "あいこ-!";
    }
    else if ((playerHand == 2 && computerHand == 0) || (playerHand == 1 && computerHand == 2) || (playerHand == 0 && computerHand == 1)) {
        result = "勝ち!!";
    }
    else {
        result = "負け...";
    }
    return result
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

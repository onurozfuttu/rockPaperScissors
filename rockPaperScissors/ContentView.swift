//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Onur Ozfuttu on 9.01.2023.
//

import SwiftUI



struct ContentView: View {
    let compPick = ["Rock", "Paper", "Scissors"]
    @State private var playerPick = ""
    @State private var gamePoint = 0
    @State var showPC: Bool = false
    @State private var lastGame = 0
    @State private var gameOver: Bool = false
    
    
//    var randomCompPick: String {
//        let randomNum = Int.random(in: 0...2)
//        let retNum = compPick[randomNum]
//        return retNum
//
//    }
    
    func randomPick(pickNew: [String]) -> String{
        let randomNum = Int.random(in: 0...2)
        let returnNum = pickNew[randomNum]
        return returnNum
    }
    
    
    
    
    var body: some View {
        VStack {
            Text("Computer's choice was \(showPC ? randomPick(pickNew: compPick) : "???")")
            VStack{
                Text("Pick your choice")
//                ForEach(0..<2){
//                    button in
//                    Button(compPick[button]){
//
//                    }
//                }
                
                Button("Rock"){
                    playerPick = "Rock"
                    gamePoint += determineWinner(comp: randomPick(pickNew: compPick), human: "Rock")
                    showPC = true
                    lastGame += 1
                    if lastGame >= 10 {
                        gameOver = true
                        gamePoint = 0
                        lastGame = 0
                    }
                }
                Button("Paper"){
                    playerPick = "Paper"
                    gamePoint += determineWinner(comp: randomPick(pickNew: compPick), human: "Paper")
                    showPC = true
                    lastGame += 1
                    if lastGame >= 10 {
                        gameOver = true
                        gamePoint = 0
                        lastGame = 0
                    }
                }
                Button("Scissors"){
                    playerPick = "Scissors"
                    gamePoint += determineWinner(comp: randomPick(pickNew: compPick), human: "Scissors")
                    showPC = true
                    lastGame += 1
                    if lastGame >= 10 {
                        gameOver = true
                        gamePoint = 0
                        lastGame = 0
                        
                    }
                }
                
            }
            Text("Your point is \(gamePoint)")
                .alert(isPresented: $gameOver){
                    Alert(title: Text("Game Over"), message: Text("Game is Over, tap OK to play again"), dismissButton: .default(Text("OK")))
//                    Button("OK", role: .cancel) {}
                }
                .padding()
            
        }
    }
    
}

func determineWinner(comp: String, human: String) -> Int{
    var addPoint = 0
    if (comp == "Rock" && human == "Paper"){
        addPoint += 1
    } else if (comp == "Paper" && human == "Scissors"){
        addPoint += 1
    } else if (comp == "Scissors" && human == "Rock"){
        addPoint += 1
    } else if (human == "Rock" && comp == "Paper"){
        if addPoint > 0{
            addPoint -= 1
        }
    } else if (human == "Paper" && comp == "Scissors"){
        if addPoint > 0{
            addPoint -= 1
        }
    } else if (human == "Scissors" && comp == "Rock"){
        if addPoint > 0{
            addPoint -= 1
        }
    }
    return addPoint
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

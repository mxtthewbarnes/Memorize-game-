//
//  ContentView.swift
//  learnSwift
//
//  Created by Matthew Barnes on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["🐳", "🐊", "🐿️", "🕊️", "🐠", "🦧", "🐝", "🦆", "🦌", "🦜", "🐇", "🐘" ]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        } .imageScale(.large)
            .font(.largeTitle)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 130))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.purple)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "plus.square.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus.square.fill")
    }
}



struct CardView: View{
    let content : String
    @State var isFace: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 6)
                    
                    Text(content).font(.largeTitle)
                }
                .opacity(isFace ? 1 : 0)
                    base.fill().opacity(isFace ? 0 : 1)
                
        }
        .onTapGesture {
            isFace.toggle()
        }
            
        }
    }
    
        

#Preview {
    ContentView()
}

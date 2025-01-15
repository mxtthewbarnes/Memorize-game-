//
//  ContentView.swift
//  learnSwift
//
//  Created by Matthew Barnes on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["🐳", "🐊", "🐿️", "🕊️"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])

        
            }
            
        }
        
        
        .foregroundColor(.green)

        .padding()
    }
}

struct CardView: View{
    let content : String
    @State var isFace: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
                if isFace{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 6)
                    
                    Text(content).font(.largeTitle)
                } else {
                    base.fill()
                }
        }
        .onTapGesture {
            isFace.toggle()
        }
            
        }
    }
    
        

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  learnSwift
//
//  Created by Matthew Barnes on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFace: true)
            CardView()
            CardView()
            CardView()
        }
        
        
        .foregroundColor(.green)

        .padding()
    }
}

struct CardView: View{
    var isFace: Bool = false
    
    var body: some View {
        
            ZStack(content: {
                if isFace{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(lineWidth: 6)
                    
                    Text("👹").font(.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                }
            })
            
        }
    }
    
        

#Preview {
    ContentView()
}

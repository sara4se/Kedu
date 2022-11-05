//
//  CardSwap.swift
//  Kedu
//
//  Created by Sara Alhumidi on 09/04/1444 AH.
//

import SwiftUI

struct CardSwap: View {
        @State private var offset = CGSize.zero
        @State private var color: Color = .black
        var person: String
        
        var body: some View {
            ZStack {
                
                    Rectangle()
                        .frame(width: 320, height: 420)
                        .border(.white, width: 6.0)
                        .cornerRadius(4)
                        .foregroundColor(color.opacity(0.15))
                        .shadow(radius: 10,x: 0,y: 10)
                    HStack {
                        Image(person).resizable()
                    
                    }
        
            }
            .offset(x: offset.width * 1, y: offset.height * 0.1)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        withAnimation {
                            changeColor(width: offset.width)
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            swipeCard(width: offset.width)
                            changeColor(width: offset.width)
                        }
                    }
            )
        }
        
        func swipeCard(width: CGFloat) {
            switch width {
            case -200...(-150):
                print("\(person) removed")
                offset = CGSize(width: -200, height: 0)
            case 150...500:
                print("\(person) added")
                offset = CGSize(width: 200, height: 0)
            default:
                offset = .zero
            }
        }
        
        func changeColor(width: CGFloat) {
            switch width {
            case -200...(-130):
                color = .gray
            case 130...500:
                color = .gray
            default:
                color = .black
            }
        }
        
        
    }

    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardSwap(person: "Mario")
        }
    }

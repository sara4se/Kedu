//
//  watchStory.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI



import SwiftUI
import AVKit

struct watchStory: View {
    @State private var readStoryIsClicked = false
    @State private var isNext = false
    var body: some View {
        ZStack(alignment: .center){
            
            Image("Background")
            HStack{
                Button(action: {
                    isNext.toggle()
                }){
                    Image("back")
                        .resizable()
                        .frame(width: 90 , height: 90)
                        .rotationEffect(.degrees(0))
                    
            }
               
            }.frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.1).offset(CGSize.init(width: -590, height: -390))
           
         
            VStack{
                HStack{
                    VideoPlayer(player: AVPlayer(url: URL(string: "https://youtu.be/OITg-bwlXe0")!))
                        .frame(width: 900, height: 650)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 20)
                    
                }.padding()
                ZStack{
                    Image("RoundedRectangle").resizable()
                        .frame(width: 280, height: 80).shadow(radius: 10)
                        .padding()
                        Button("Read The Story 📖", action: {readStoryIsClicked = true})
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                }
            }
            if readStoryIsClicked{
                StoryTitlePage_letsBeFriends()
            }
            if isNext{
                ChooseStoryScreen()
            }
        }
        .padding()
    }
}

struct watchStory_Previews: PreviewProvider {
    static var previews: some View {
        watchStory()
    }
}

//
//  letsBeFriends_2.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct letsBeFriends_2: View {
    @State private var nextIsClicked = false
    @State private var previousIsClicked = false
    @State private var watchStoryIsClicked = false
    var body: some View {
        ZStack {
            Image("Background")
            VStack{
//                HStack{
//                    Image("Back").resizable()
//                        .frame(width: 100, height: 100)
//                        .shadow(radius: 10)
//                    Image(systemName: "settings")
//                }
                    HStack{
                        Button("〈 ", action: {previousIsClicked = true})
                            .font(.system(size: 64))
                            .foregroundColor(.gray)
                            .shadow(radius: 10)
                        VStack{
                            HStack{
                                Image("story5")
                                    .resizable()
                                    .frame(width: 400, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 20)
                                    .padding(.leading, 80)
                                Image("story6")
                                    .resizable()
                                    .frame(width: 400, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 20)
                                    .padding(.trailing, 80)
                            }
                            HStack{
                                Image("story7")
                                    .resizable()
                                    .frame(width: 400, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 20)
                                    .padding(.leading, 80)
                                Image("story8")
                                    .resizable()
                                    .frame(width: 400, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 20)
                                    .padding(.trailing, 80)
                            }
                        }
                        Button(" 〉", action: {
                            nextIsClicked = true
                            print("i am in letsBeFriends_3")
                        })
                        .font(.system(size: 64))
                        .foregroundColor(.gray)
                        .shadow(radius: 10)
                }
                    .padding()
                ZStack{
                    Image("RoundedRectangle").resizable()
                        .frame(width: 280, height: 80).shadow(radius: 10)
                        .padding()
                    HStack{
                        Image(systemName: "play")
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                        Button("Watch The Story", action: {watchStoryIsClicked.toggle()})
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                            
                    }
                }
               
            }
            if previousIsClicked{
                letsBeFriends_1()
            }
            if nextIsClicked {
           
                letsBeFriends_3()
                
            }
            else if  watchStoryIsClicked{
                watchStory()
            }
        }
        .padding()
    }
}

struct letsBeFriends_2_Previews: PreviewProvider {
    static var previews: some View {
        letsBeFriends_2()
    }
}

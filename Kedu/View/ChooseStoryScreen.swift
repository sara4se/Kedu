//
//  ChooseStoryScreen.swift
//  Kedu
//
//  Created by Sara Alhumidi on 09/04/1444 AH.
//

import SwiftUI

struct ChooseStoryScreen: View {
    @State private var isNext = false
    @State private var isShowingDetailView = false
    private var story: [String] = ["Title", "Title1", "Title2", "Title", "Title1"].reversed()
    var body: some View {
      
        ZStack{
            
            Image("Image").resizable().scaledToFill().ignoresSafeArea(.all)
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
                Text("Pick a story").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                
                HStack(alignment: .center,spacing: 250){
                  
                        HStack{
                          
                            CardSwap(person: story[0])
                            CardSwap(person: story[1])         .padding(.leading,-140)
                            CardSwap(person: story[2])
                                .padding(.leading,-150)
                               
                        } .contentShape(Rectangle())
                        .onTapGesture {
                            MainView()
                            debugPrint("Whole view as touch")
                        }
                     VStack{
                        Image("Gcharcter").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.height * 0.5).shadow(radius: 10,x: 0,y:16 )
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.5 ,height: UIScreen.main.bounds.height * 0.3).padding(.all,100)
                
            }
           if isNext{
             MainView()
            }
        }
    }
}
struct ChooseStoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseStoryScreen()
    }
}

//                        VStack {
//                            ZStack{
//                                ForEach(story, id: \.self) { story in
//                                    CardSwap(person: story)
//                                }
//                            }.onTapGesture {
//                                withAnimation(.easeInOut) {
//
//                                    }
//
//                            }
//
//                        }.frame(width: UIScreen.main.bounds.width * 0.3 ,height: UIScreen.main.bounds.height * 0.3)
//

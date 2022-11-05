//
//  MainView.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct MainView: View {
    @State private var AchievementsClicked = false
    @State private var GamesClicked = false
    @State private var StoriesClicked = false
    @State private var EditClicked  = false
    @State private var isNext = false
    @State private var isShowingDetailView = false
    var body: some View {
        
        ZStack (alignment: .center) {
   
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
           
         
            VStack(alignment: .center, spacing: 1) {
                
               HStack (spacing: 200){
                    Text("Hello Hero")
                       .font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .frame(width: 300,height: 78)
                    
                    Image("readingBoy")
                        .resizable()
                        .frame(width: 236.72, height: 94.43)
                    
                    
                    
                }
                HStack(alignment: .center) {
                    VStack (alignment: .center,spacing: 3){
                        
                        Button(action:{
                            AchievementsClicked = true
                        }, label: {
                            ZStack{
                                Image("AchievementBtn")
                                    .resizable()
                                    .frame(width: 478, height: 158.04)
                                Text("Achievements").foregroundColor(.white).font(.system(size: 48))
                            }
                        })
                        Button(action:{
                            GamesClicked = true
                        }, label: {
                            ZStack{
                                Image("GameBtn")
                                    .resizable()
                                    .frame(width: 478, height: 442)
                                Text("Let's have fun").foregroundColor(.white).font(.system(size: 80)).multilineTextAlignment(.center).frame(width: 350, height: 241)
                            }
                        })
                        
                    }
                    VStack (alignment: .center, spacing: 3){
                        Button(action:{
                            StoriesClicked = true
                        }, label: {
                            ZStack{
                                Image("StoriesBtn")
                                    .resizable()
                                    .frame(width: 447, height: 410)
                                Text("Let's read").foregroundColor(.white).font(.system(size: 80)).multilineTextAlignment(.center)
                                    .frame(width: 297, height: 211)
                            }
                        })
                        
                        Button(action:{
                            EditClicked = true
                        }, label: {
                            ZStack{
                                Image("EditBtn")
                                    .resizable()
                                    .frame(width: 447, height: 193)
                                Text("Edit my character").foregroundColor(.white).font(.system(size: 48)).multilineTextAlignment(.center).frame(width: 363, height: 140)
                            }
                        })
                        
                    }
                    
                    
                }
                
            }
            if isNext{
                
                RegestrationView()
                
            }
            if AchievementsClicked{
                
                Achievements()
                
            } else if StoriesClicked{
                
                ChooseStoryScreen()
                
            } else if GamesClicked{
                
                ChooseActivityGame()
                
            } else if EditClicked{
                
                RegestrationView()
                
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ContentView.swift
//  Kedu
//
//  Created by Sara Alhumidi on 01/04/1444 AH.
//

import SwiftUI

extension Color {
    static let softPink = Color("pinky")
}

struct Game2Screen2: View {
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var  heightSizeClass: UserInterfaceSizeClass?
    @State private var isNext = false
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    @State private var offset1 = CGSize.zero
    @State private var isDragging1 = false
    @State private var offset2 = CGSize.zero
    @State private var isDragging2 = false
    @State private var offset3 = CGSize.zero
    @State private var isDragging3 = false
    @State private var offset4 = CGSize.zero
    @State private var isDragging4 = false
    @State private var isShowingDetailView = false
    var body: some View {
        
        ZStack{
            
            Image("Image")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
                  HStack{
                      Button(action: {
                          isNext.toggle()
                      }){
                          Image("back")
                              .resizable()
                              .frame(width: 90 , height: 90)
                              .rotationEffect(.degrees(0))
                          
                      }
                      Spacer()
                      Text("Free Time").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                      
                  }.frame(width: UIScreen.main.bounds.width * 0.55, height: UIScreen.main.bounds.height * 0.2).offset(CGSize.init(width: -250, height: -380))
                  
            VStack(alignment:.center){
             
                //                first rectangl
                ZStack{
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.4 ,height: UIScreen.main.bounds.width * 0.2 ).cornerRadius(30).foregroundColor(.white)
                    Image("Image3")
                        .resizable().frame(width: UIScreen.main.bounds.width * 0.4
                                           ,height: UIScreen.main.bounds.height * 0.2).cornerRadius(30)
                }
                Text("Choose Activities!")
                    .font(Font.custom("AnnieUseYourTelescope-Regular", size: 30)).foregroundColor(.gray)
                //                middel rectangl
                ZStack{
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.5
                                      ,height: UIScreen.main.bounds.height * 0.18).cornerRadius(30).foregroundColor(.softPink)
                    HStack{
                        
                        RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.145 ,height: UIScreen.main.bounds.height * 0.14).foregroundColor(.white)
                        
                        
                        RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.145,height: UIScreen.main.bounds.height * 0.14).foregroundColor(.white)
                        
                        
                        RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.145 ,height: UIScreen.main.bounds.height * 0.14).foregroundColor(.white)
                        
                    }
                }
                
                //last rectangl
                ZStack{
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.2).cornerRadius(30).foregroundColor(.white).padding(20)
                    HStack(spacing: 28){
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.height * 0.15).foregroundColor(.white)
                            Image("k1")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.12,height: UIScreen.main.bounds.height * 0.14).cornerRadius(30).scaleEffect(isDragging ? 0.5 : 1 ).offset(offset).gesture(DragGesture().onChanged(){
                                    value in
                                    isDragging=true
                                    offset = value.translation
                                    
                                }
                                    .onEnded(){ value in
                                        withAnimation{
                                            offset = value.translation
                                            isDragging = false
                                        }
                                    }
                                )
                            
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.height * 0.15).foregroundColor(.white)
                            Image("k2")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.12,height: UIScreen.main.bounds.height * 0.14)
                                .cornerRadius(30).scaleEffect(isDragging1 ? 0.5 : 1 ).offset(offset1).gesture(DragGesture().onChanged(){
                                    value in
                                    isDragging1=true
                                    offset1 = value.translation
                                    
                                }
                                    .onEnded(){ value in
                                        withAnimation{
                                            offset1 = value.translation
                                            isDragging1 = false
                                        }
                                    }
                                )
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.height * 0.15).foregroundColor(.white)
                            Image("k3")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.12
                                                   ,height: UIScreen.main.bounds.height * 0.14)
                                .cornerRadius(30).scaleEffect(isDragging2 ? 0.5 : 1 ).offset(offset2).gesture(DragGesture().onChanged(){
                                    value in
                                    isDragging2=true
                                    offset2 = value.translation
                                    
                                }
                                    .onEnded(){ value in
                                        withAnimation{
                                            offset2 = value.translation
                                            isDragging2 = false
                                        }
                                    }
                                )
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.height * 0.15).foregroundColor(.white)
                            Image("k4")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.12,height: UIScreen.main.bounds.height * 0.14)
                                .cornerRadius(30).scaleEffect(isDragging3 ? 0.5 : 1 ).offset(offset3).gesture(DragGesture().onChanged(){
                                    value in
                                    isDragging3=true
                                    offset3 = value.translation
                                    
                                }
                                    .onEnded(){ value in
                                        withAnimation{
                                            offset3 = value.translation
                                            isDragging3 = false
                                        }
                                    }
                                )                        }
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).stroke(Color.black, lineWidth: 1).frame(width: UIScreen.main.bounds.width * 0.15,height: UIScreen.main.bounds.height * 0.15).foregroundColor(.white)
                            Image("k5")
                                .resizable().frame(width: UIScreen.main.bounds.width * 0.12
                                                   ,height: UIScreen.main.bounds.height * 0.14)
                                .cornerRadius(30).scaleEffect(isDragging4 ? 0.5 : 1 ).offset(offset4).gesture(DragGesture().onChanged(){
                                    value in
                                    isDragging4=true
                                    offset4 = value.translation
                                    
                                }
                                    .onEnded(){ value in
                                        withAnimation{
                                            offset4 = value.translation
                                            isDragging4 = false
                                        }
                                    }
                                )
                        }
                    }
                    
                }
            }.padding(.top,150)
            
            if isNext{
                Game2Screen()
            }
        }
    }
}
    struct Game1View_Previews: PreviewProvider {
        static var previews: some View {
            Game2Screen2()
        }
    }


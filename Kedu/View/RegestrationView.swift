//
//  RegestrationView.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct AgesRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            Text(title)
                .font(.system(size: isSelected ? 90 : 48))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
        }
    }
}

struct RegestrationView: View {
    @State private var isShowingDetailView = false
    @State private var username: String = ""

    @State private var isClicked = false
    
    @State private var firstTime = true
    @State var ages: [String] = ["3", "4", "5", "6", "7","8"]
    @State var selections: [String] = ["5"]
    @State private var OkIsClicked = false
    
    var body: some View {
   
            ZStack (alignment: .center) {
                Image("Image").resizable().scaledToFill().ignoresSafeArea(.all)
           
                
                VStack(alignment: .center, spacing: 80) {
                    HStack (alignment: .center, spacing: 40){
                        VStack (alignment: .center,spacing: 50){
                            Text("Name")
                                .font(.system(size: 60))
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                            
                            TextField(" ", text: $username
                            ).frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.1)
                                .background(in: RoundedRectangle(cornerRadius: 25))
                            Text("Age")
                                .font(.system(size: 60))
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                            
                            ScrollView (.horizontal) {
                                HStack(spacing: 50){
                                    ForEach(ages, id: \.self) { age in
                                        AgesRow(title: age, isSelected: self.selections.contains(age)) {
                                            if self.selections.contains(age) {
                                                self.selections.removeAll()
                                            } else {
                                                self.selections.removeAll()
                                                self.selections.append(age)
                                            }
                                        }
                                    }
                                }
                            }.font(.system(size: 48))
                                .containerShape(RoundedRectangle(cornerRadius: 50)).frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.1)
                                
                        }.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.1)
                        
                        VStack (alignment: .center,spacing: 20){
                            
                            Text("Choose your character")
                                .font(.system(size: 60))
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.2)
                            HStack (alignment: .center, spacing : 30){
                                Button(action: {
                                    isClicked.toggle()
                                }){
                                    Image("back")
                                        .resizable()
                                        .frame(width: 100 , height: 100)
                                        .rotationEffect(.degrees(0))
                                       
                                        
                                }
                                if isClicked{
                                    Image("girlChar").frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                                } else {
                                    Image("boyChar").frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                                }
                                Button(action: {
                                    isClicked.toggle()
                                }){
                                    Image("back").resizable().rotationEffect(.degrees(180))
                                        .frame(width: 100 , height: 100)
                                        
                                }
                                
                            }.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.4).padding(.leading,50)
                        }
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.5)
                    
                    Button(action:{
                        OkIsClicked = true
                    }, label: {
                        ZStack (alignment : .center){
                            Image("OkButton")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                            Text("Okay")
                                .foregroundColor(.white)
                                .font(.system(size: 48))
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                        }
                    })
                    
                }
                
                if OkIsClicked {
                    
                    MainView()
                }
            
             
            }
               
    }
}
struct RegestrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegestrationView()
    }
}

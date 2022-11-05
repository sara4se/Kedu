//
//  mGame.swift
//  Kedu
//
//  Created by Sara Alhumidi on 08/04/1444 AH.
//

import SwiftUI

extension Color {
    static let yellow1 = Color("yellow1")
    static let lightBlue = Color("lightBlue")
    
}


struct Game1Screen: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    @State private var isShowingView = false
    @State private var isNext = false
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
                    Spacer()
                    Text("Memory Match").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.2).offset(CGSize.init(width: -240, height: -380))
                
                
                VStack{
                    
                    HStack(alignment: .bottom){
                        
                        VStack(content:
                                {
                            
                            Grid(items: viewModel.cards) { card in
                                cardView(card: card).onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        viewModel.choose(card: card)
                                    }
                                }.padding(4)
                            }
                            .foregroundColor(Color(viewModel.theme.accentColor))
                            
                        }).frame(width: UIScreen.main.bounds.width * 0.6 ,height: UIScreen.main.bounds.height * 0.6).padding(.all , 10)
                        HStack(alignment: .bottom,content: {
                            Rectangle().frame(width: UIScreen.main.bounds.width * 0.3 ,height: UIScreen.main.bounds.height * 0.7 ).cornerRadius(30).foregroundColor(.yellow1)
                                .overlay{
                                    VStack(alignment: .center, spacing : 0){
                                        
                                        Button(action: {
                                            print("button animale")
                                            
                                        })
                                        {
                                            
                                            Rectangle().frame(width: UIScreen.main.bounds.width * 0.25 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                                .overlay{
                                                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white)
                                                        .overlay (alignment: .top) { Text("Animals").font(Font.custom("AnnieUseYourTelescope-Regular", size: 40)).bold().foregroundColor(.black)
                                                            
                                                        }
                                                    
                                                    Image("animalBt").resizable().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.15).padding(.top,80)
                                                }
                                            
                                        }
                                        Button(action: {
                                            print("button pressed")
                                        })
                                        {
                                            Rectangle().frame(width: UIScreen.main.bounds.width * 0.25 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                                .overlay{
                                                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white)
                                                        .overlay (alignment: .top) { Text("Objects").font(Font.custom("AnnieUseYourTelescope-Regular", size: 40)).bold().foregroundColor(.black)
                                                        }
                                                    Image("objectBt").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.height * 0.15).padding(.top,80)
                                                }
                                            
                                        }
                                        Button(action: {
                                            print("button pressed")
                                        })
                                        {
                                            
                                            Rectangle().frame(width: UIScreen.main.bounds.width * 0.25 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                                .overlay{
                                                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.height * 0.15).cornerRadius(8).foregroundColor(.white)
                                                        .overlay (alignment: .top) { Text("Food").font(Font.custom("AnnieUseYourTelescope-Regular", size: 40)).bold().foregroundColor(.black)
                                                        }
                                                    Image("foodBt").resizable().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.15).padding(.top,80)
                                                }
                                            
                                        }
                                    }
                                }
                            
                        })
                        
                    }
                    Button(action:{
                        withAnimation(.easeInOut) {
                            viewModel.resetGame()
                        }
                    }, label: {
                        ZStack (alignment : .center){
                            Image("OkButton")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                            Text("Again")
                                .foregroundColor(.white)
                                .font(.system(size: 48))
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                        }
                    })
                
                
                }.padding(.top,140)
            if isNext{
                ChooseActivityGame()
            
            }
        }
 
    }
}

struct cardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(
                            startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-animatedBonusRemaining * 360 - 90),
                            clockwise: true
                        ).onAppear{
                            self.startBonusTimeAnimation()
                        }
                    } else {
                        Pie(
                            startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90),
                            clockwise: true
                        )
                    }
                }.padding(5).opacity(0.25).transition(.identity)
                
                Image(card.content)
                    .resizable()
                    .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)

        }
    }
    // MARK: - drawing constants


}


struct Game1Screen_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGameViewModel(theme: DefaultThemes.theme0)
        game.choose(card: game.cards[5])
        return Game1Screen(viewModel: game)
    }
}

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
    var body: some View {
        NavigationStack {
            
        ZStack{
            Image("Image").resizable().scaledToFill().ignoresSafeArea(.all)
            VStack{
                Text("Memory Match").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                HStack{
                    
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
                    HStack(content: {
                        Rectangle().frame(width: UIScreen.main.bounds.width * 0.3 ,height: UIScreen.main.bounds.height * 0.5 ).cornerRadius(30).foregroundColor(.yellow1)
                            .overlay{
                                VStack(alignment: .center, spacing : 0){
                                    
                                    Button(action: {
                                        print("button pressed")
                                    })
                                    {
                                        
                                        Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                            .overlay{
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white)
                                                    .overlay (alignment: .top) { Text("Animals").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black)
                                                        
                                                    }
                                                
                                                Image("animalBt").resizable().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).padding(.top,80)
                                            }
                                        
                                    }
                                    Button(action: {
                                        print("button pressed")
                                    })
                                    {
                                        Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                            .overlay{
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white)
                                                    .overlay (alignment: .top) { Text("Objects").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black)
                                                    }
                                                Image("objectBt").resizable().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).padding(.top,80)
                                            }
                                        
                                    }
                                    Button(action: {
                                        print("button pressed")
                                    })
                                    {
                                        
                                        Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white).padding(.top , 80)
                                            .overlay{
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).cornerRadius(8).foregroundColor(.white)
                                                    .overlay (alignment: .top) { Text("Food").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black)
                                                    }
                                                Image("foodBt").resizable().frame(width: UIScreen.main.bounds.width * 0.1 ,height: UIScreen.main.bounds.height * 0.1).padding(.top,80)
                                            }
                                        
                                    }
                                }.padding(.bottom,80)
                            }.padding(.trailing, 30)
                        
                    })
                    
                }
                Button(action: {
                    withAnimation(.easeInOut) {
                        viewModel.resetGame()
                    }
                }, label: {
                    Image("rect").resizable().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.1).overlay{
                        Text("Play again").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).foregroundColor(.red).bold()
                    }
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            self.isShowingView.toggle()
            print("hello")
        }){
            Image("BackBt")
                .frame(width: 100 , height: 100)
                .shadow(radius : 2 , x : 5 , y :0)
        }
        )
        .navigationDestination(isPresented: $isShowingView, destination: {
            Game2Screen()
        })
        
    }.navigationViewStyle(.stack)
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

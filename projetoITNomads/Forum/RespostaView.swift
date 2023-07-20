//
//  RespostaView.swift
//  projetoITNomads
//
//  Created by Student04 on 18/07/23.
//

import SwiftUI

struct RespostaView: View {
    
    @StateObject var viewModelForum = ViewModelforum()

    
    @State var id: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mint, .white]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    ForEach(viewModelForum.chars, id: \._id!){ per in
                        if per._id! == id {
                            Text(per.tituloPergunta!)
                                .font(.largeTitle.bold())
                            
                            
                            NavigationLink(destination: ProfileView(presentSideMenu: .constant(true), userNameLocal: per.userPergunta!)){
                                Text(per.userPergunta!)
                                    .foregroundColor(.black)
                                    .font(.title3.bold())
                                    .padding(5)
                            }
                            
                            
                            Text(per.pergunta!)
                                .font(.title3)
                                .padding(20)
                            HStack{
                                ForEach(1...10, id: \.self){ i in
                                    Circle()
                                        .frame(width: 5, height: 5)
                                }
                            }
                            
                            
                            ForEach(per.respostas, id: \.resposta!){ res in
                                VStack{
                                    HStack{
                                        NavigationLink(destination: ProfileView(presentSideMenu: .constant(true), userNameLocal: res.userResposta!)){
                                            Text(res.userResposta!)
                                                .foregroundColor(.black)
                                                .font(.title3.bold())
                                                .padding(5)
                                        }
                                        
                                        /*
                                        Text(res.userResposta!)
                                            .font(.title3.bold())
                                            .padding(5)
                                         */
                                        Spacer()
                                    }
                                    Text(res.resposta!)
                                        .padding(10)
                                    
                                    
                                    Rectangle()
                                        .frame(width: 300, height: 2)
                                        .foregroundColor(.gray)
                                        .padding(20)
                                    
                                }
                                //.padding(15)
                            
                                
                            }
                        }
                    }
                }
            }.onAppear(){
                viewModelForum.fetch()
            }
        }
    }
}

struct RespostaView_Previews: PreviewProvider {
    static var previews: some View {
        RespostaView(id: String())
    }
}


//
//  ForumEspecificoView.swift
//  projetoITNomads
//
//  Created by Student04 on 18/07/23.
//

import SwiftUI

struct ForumEspecificoView: View {
    
    @Binding var presentSideMenu: Bool
    
    @StateObject var viewModelForum = ViewModelforum()
    
    
    @State var nomePais: String = "Especifico"
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .teal]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack{
                        Text(nomePais)
                            .font(.largeTitle.bold())
                        
                        
                        ForEach(viewModelForum.chars, id: \._id){ per in
                            if per.pais! == nomePais {
                                NavigationLink(destination: RespostaView(id: per._id!)){
                                    Text(per.tituloPergunta!)
                                        .foregroundColor(.black)
                                }
                                .font(.title)
                                
                                NavigationLink(destination: ProfileView(presentSideMenu: .constant(true), userNameLocal: per.userPergunta!)){
                                    Text(per.userPergunta!)
                                        .foregroundColor(.black)
                                        .font(.title3)
                                }
                                .font(.title)
                                    
                                    
                                
                                Spacer()
                                    
                                HStack{
                                    
                                    Image(systemName: "heart")
                                    
                                    NavigationLink(destination: RespostaView(id: per._id!)){
                                        Image(systemName: "ellipsis.message")
                                            .foregroundColor(.black)
                                    }
                                    
                                    Image(systemName: "arrowshape.turn.up.right")

                                }
                                Spacer(minLength: 15)
                                Rectangle()
                                    .frame(width: 300, height: 2)
                                    .foregroundColor(.gray)
                            }
                            
                        }
                    }
                }.onAppear(){
                    viewModelForum.fetch()
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct ForumEspecificoView_Previews: PreviewProvider {
    static var previews: some View {
        ForumEspecificoView(presentSideMenu: .constant(true), nomePais: String())
    }
}

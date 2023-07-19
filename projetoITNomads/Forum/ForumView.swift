//
//  ForumView.swift
//  projetoITNomads
//
//  Created by Student08 on 13/07/23.
//

import SwiftUI

struct ForumView: View {
    
    @Binding var presentSideMenu: Bool
    
    @StateObject var viewModelForum = ViewModelforum()
    
    
    @State var nomePais: String = "Geral"
    
    var body: some View {
        ZStack{
            
            ScrollView{
                        VStack{
                            Text(nomePais)
                                .font(.largeTitle.bold())
                            
                            
                            ForEach(viewModelForum.chars, id: \._id){ per in
                                if nomePais == "Geral" {
                                    NavigationLink(destination: RespostaView(id: per._id!)){
                                        Text(per.tituloPergunta!)
                                    }
                                        .font(.title)
                                    Text(per.userPergunta!)
                                    Rectangle()
                                }
                                
                            }
                        }
                    }.onAppear(){
                        viewModelForum.fetch()
                }
            
            VStack{
                HStack{
                    Spacer()
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "list.dash")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(.black)
                    }
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView(presentSideMenu: .constant(true))
    }
}

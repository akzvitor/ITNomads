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
        ZStack{
            
            ScrollView{
                        VStack{
                            Text(nomePais)
                                .font(.largeTitle.bold())
                            
                            
                            ForEach(viewModelForum.chars, id: \._id){ per in
                                if per.pais! == nomePais {
                                    
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
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "list.dash")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct ForumEspecificoView_Previews: PreviewProvider {
    static var previews: some View {
        ForumEspecificoView(presentSideMenu: .constant(true))
    }
}

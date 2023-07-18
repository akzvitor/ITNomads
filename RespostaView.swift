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
        ScrollView{
            VStack{
                ForEach(viewModelForum.chars, id: \._id!){ per in
                    if per._id! == id {
                        Text(per.tituloPergunta!)
                            .font(.largeTitle.bold())
                        Text(per.userPergunta!)
                        Text(per.pergunta!)
                            .font(.title2)
                            .padding(20)
                        
                        
                        ForEach(per.respostas, id: \.resposta!){ res in
                            VStack{
                                Text(res.userResposta!)
                                Text(res.resposta!)
                            }
                            .padding(15)
                            
                        }
                    }
                }
            }
        }.onAppear(){
            viewModelForum.fetch()
    }
    }
}

struct RespostaView_Previews: PreviewProvider {
    static var previews: some View {
        RespostaView(id: String())
    }
}

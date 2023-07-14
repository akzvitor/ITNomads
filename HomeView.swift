//
//  HomeView.swift
//  projetoITNomads
//
//  Created by Student08 on 13/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    
    @StateObject var vviewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                ScrollView{
                    VStack{
                        Text("Destaques")
                            .font(.largeTitle.bold())
                            .padding(40)
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            //Text("\(vviewModel.localizacao.count)")
                            ForEach(vviewModel.localizacao){ p in
                                
                                NavigationLink(destination: ForumView(presentSideMenu: .constant(true), nomePais: p.name)){
                                    Text("\(p.name)")
                                        .font(.title)
                                        .padding(10)
                                }
                                
                            }
                        }
                    }.onAppear(){
                        vviewModel.fetch()
                    }
                    
                    Spacer()
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
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(true))
    }
}

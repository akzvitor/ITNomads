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
    
    func flag(country: String) -> String {
        let base: UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .teal]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack{
                        Text("Destaques")
                            .font(.largeTitle.bold())
                            .padding(40)
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            //Text("\(vviewModel.localizacao.count)")
                            ForEach(vviewModel.localizacao){ p in
                                
                                NavigationLink(destination: ForumEspecificoView(presentSideMenu: .constant(true), nomePais: p.name)){
                                    Text(flag(country: p.regionalIndicator))
                                        .font(.system(size: 50))
                                    Text("\(p.name)")
                                        .font(.title)
                                        .padding(10)
                                        .foregroundColor(.black)
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
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(true))
    }
}

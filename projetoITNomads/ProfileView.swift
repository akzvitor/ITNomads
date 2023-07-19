//
//  ProfileView.swift
//  projetoITNomads
//
//  Created by Student08 on 13/07/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var presentSideMenu: Bool
    
    @StateObject var viewModeluser = viewModelUser()
    @State var userNameLocal: String = "Eterno09"
    
    var body: some View {
        ZStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.mint, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
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
                    ForEach(viewModeluser.chars, id: \._id){ user in
                        if(userNameLocal == user.userName!){
                            VStack{
                                HStack{
                                    AsyncImage(url: URL(string: user.fotoDePerfil!)){ image in
                                        image.resizable()
                                            .clipShape(Circle())
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        
                                    }.frame(width: 125, height: 125)
                                    
                                    VStack{
                                        HStack{
                                            Text(user.userName!)
                                                .font(.title)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("📍 "+user.paisOndeMora!)
                                            Spacer()
                                        }
                                        HStack{       Text(" "+user.ocupacao!)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .onAppear(){
                    viewModeluser.fetch()
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(true))
    }
}

 

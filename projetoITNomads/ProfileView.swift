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
    @State var userNameLocal: String = "eterno09"
    
    var body: some View {
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
            Text("Profile View")
            ForEach(viewModeluser.chars, id: \._id){ user in
                if(userNameLocal == user.userName!){
                    Text(user.userName!)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(true))
    }
}

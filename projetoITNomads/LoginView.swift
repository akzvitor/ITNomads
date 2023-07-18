//
//  LoginView.swift
//  projetoITNomads
//
//  Created by Student04 on 18/07/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username = ""
    
    var body: some View {
        NavigationStack{
            TextField("Digite aqui", text: $username)
            
            
            NavigationLink(destination: MainTabbedView(userName: username)){
                Text("Enter")
            }
        }    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

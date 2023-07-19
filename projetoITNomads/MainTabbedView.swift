//
//  ContentView.swift
//  projetoITNomads
//
//  Created by Student08 on 13/07/23.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    @State var userName = ""
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                MapView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ForumView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                ProfileView(presentSideMenu: $presentSideMenu, userNameLocal: userName)
                    .tag(3)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu, username: userName)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView(userName: String())
    }
}

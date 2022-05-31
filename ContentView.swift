//
//  ContentView.swift
//  ListResto
//
//  Created by Macbook Pro on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth: ModelData
    
    @State private var select: Tab = .home
    
    enum Tab {
        case home
        case list
        case user
    }
    
    var body: some View {
        if (!auth.loggedIn) {
            LoginPage()
        }else{
            TabView(selection: $select){
                HistoryHome()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)
                
                RestoList()
                    .tabItem {
                        Label("All Restos", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
                
                ProfileDetail()
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

//
//  MainTabView.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 14.11.2026.
//

import SwiftUI

struct MainTabView: View{
    var body: some View{
        TabView{
            ContentView()
                .tabItem{
                    Label("Главная", image: "House 1")
                }
            
            Text("Приёмы")
                .tabItem{
                    Label("Приёмы", image: "Calendar")
                }
            Text("Чат")
                .tabItem{
                    Label("Чат", image: "Chat")
                }
            Text("Профиль")
                .tabItem{
                    Label("Профиль", image: "Profile")
                }
        }
        .tint(Color("ColorPink"))
    }
}

//
//  TabBar.swift
//  Check
//
//  Created by Salih Çakmak on 14.04.2022.
//

import SwiftUI

import Lottie


struct TabBar: View {
    
 
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white.withAlphaComponent(0)
        UITabBar.appearance().backgroundImage = UIImage()
        
    }
    
    
    var body: some View {
   
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            TimerView()
                .tabItem {
                    Image(systemName: "timer")

                    Text("Timer")
                }

            
        }
        
        .accentColor(.black)
    
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        
    }
}

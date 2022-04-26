//
//  MainView.swift
//  Check
//
//  Created by Salih Çakmak on 12.02.2022.
//

import SwiftUI
import Lottie

struct MainView: View {
    @State private var lottieID = UUID()

    var body: some View {
      ZStack {
         
            LottieView(name: "background", loopMode: .repeat(.infinity))
                .aspectRatio( contentMode: .fill)
                .frame(width: 2000, height: 1500, alignment: .center)
           
           
            LottieView(name: "gamer", loopMode: .repeat(.infinity))
                .frame(width: 500, height: 500, alignment: .top)
    
            
        }
        .frame(minWidth:30, minHeight: 20, alignment: .center)
        .ignoresSafeArea(.all)
        .id(lottieID)
        .onAppear {
                        lottieID = UUID()
                    }
    }
}



struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .ignoresSafeArea(.all)
    }
}

//
//  TimerBackground.swift
//  Check
//
//  Created by Salih Çakmak on 16.04.2022.
//

import SwiftUI
import Lottie

struct TimerBackground: View {
    @State private var lottieID = UUID()

    var body: some View {
        ZStack {
         
            LottieView(name: "background", loopMode: .repeat(.infinity))
                .aspectRatio( contentMode: .fill)
                .frame(width: 2000, height: 1500, alignment: .center)


            Spacer()
            LottieView(name: "omm", loopMode: .repeat(.infinity))
                .frame(width: 440, height: 500, alignment: .top)
                .offset(y:100)

        }
        
        .frame(minWidth:30, minHeight: 20, alignment: .center)
        .ignoresSafeArea(.all)
        .id(lottieID)
        .onAppear {
                       lottieID = UUID()
                    }

    }
}

struct TimerBackground_Previews: PreviewProvider {
    static var previews: some View {
        TimerBackground()
    }
}

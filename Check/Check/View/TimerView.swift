//
//  TimerView.swift
//  Check
//
//  Created by Salih Çakmak on 14.04.2022.
//

import SwiftUI
import Lottie


struct TimerView: View {
    @ObservedObject var timerManager = TimerManager()
    @State var selectedPickerIndex = 0
    let availableMinutes = Array(1...59)
    
    
    enum Privacy: String, Identifiable, CaseIterable {
        case open = "Open"
        case closed = "Closed"
        var id: String { self.rawValue }
    }
    
 
    var body: some View {
        NavigationView {
            
            
            ZStack {
                 TimerBackground()
                
                VStack {
                          Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                              .font(.custom(FontsManager.TurretRoad.bold,size: 100))
                              .padding(.top, 80)
                              .offset(y:-150)
                          Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 120, height: 120)
                              .foregroundColor(Color("eggplant"))
                              .onTapGesture(perform: {
                                  if self.timerManager.timerMode == .initial {
                               // gecis reklamı

                                      self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                                  }
                                  self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                              })
                              .offset(y:-150)
                          if timerManager.timerMode == .paused {
                              Image(systemName: "gobackward")
                                  .aspectRatio(contentMode: .fit)
                                  .frame(width: 50, height: 50)
                                  .padding(.top, 40)
                              .onTapGesture(perform: {
                                  self.timerManager.reset()
                              })
                              .offset(x: 120,y:-285)

                          }
                    
                          Spacer()
                          if timerManager.timerMode == .initial {
                              
                              
                              Picker(selection: $selectedPickerIndex, label: Text("")
                                        .font(.largeTitle)) {
                                  ForEach(0 ..< availableMinutes.count) {
                                      Text("\(self.availableMinutes[$0]) min")
                                          .padding()
                                          .background(Color.white.opacity(0.2))
                                          //.tag(availableMinutes)
                                  }
                                  

                                 


                              }
                                .offset(y:-100)

                                .pickerStyle(.wheel)
                              .accentColor(.white)
                              
                              .labelsHidden()
                          }
                    
                          Spacer()
                      }
                      //.navigationBarTitle("Timer")
                .font(.custom(FontsManager.TurretRoad.bold,size: 40))
            }

              }
                  }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

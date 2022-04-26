//
//  CheckBox.swift
//  Check
//
//  Created by Salih Çakmak on 12.04.2022.
//

import SwiftUI

struct CheckBox: ToggleStyle {
   
    func makeBody(configuration: Configuration) -> some View {
        
        return HStack{
           
            
            Image(systemName: configuration.isOn ? "checkmark.seal.fill": "seal")
                
                .foregroundColor(configuration.isOn ? Color("eggplant") : Color.black)
                .font(.custom(FontsManager.TurretRoad.medium,size: 30))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
            Spacer()
            
           
     }
  }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("place holder",isOn:.constant(false))
            .toggleStyle(CheckBox())
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}



    



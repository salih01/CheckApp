//
//  ListRowItemView.swift
//  Check
//
//  Created by Salih Çakmak on 12.04.2022.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContex
    @ObservedObject var item : Item
    
    var body: some View {
        
        Toggle(isOn:$item.completion){
            Text(item.task ?? "")
                .font(.custom(FontsManager.TurretRoad.medium, size: 20))
                .foregroundColor(item.completion ? Color("eggplant") : Color.black)
                .padding(.vertical,10)
                .animation(.default)
        }
        .toggleStyle(CheckBox())
        .onReceive(item.objectWillChange, perform: { _ in
            
            if self.viewContex.hasChanges{
                try? self.viewContex.save()
            }
        })
        
        
    }
}

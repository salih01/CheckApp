//
//  ContentView.swift
//  Check
//
//  Created by Salih Çakmak on 11.02.2022.
//

import SwiftUI
import CoreData
import Lottie


struct ContentView: View {
    
    @State var task:String = ""
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
  
    var body: some View {
        NavigationView {
            ZStack {
                ZStack{
                    MainView()
                }
              
                VStack {
                    
                    HStack(spacing: 10){
                        Text("Check")
                            .font(.custom(FontsManager.TurretRoad.bold,size: 40))
                            //.font(.system(.largeTitle,design: .monospaced))
                            //.fontWeight(.light)
                            .padding(.leading,16)
                        
                        Spacer()
                        
                        EditButton()
                            .padding(.horizontal,16)
                            .font(.custom(FontsManager.TurretRoad.medium,size: 25))
                            .frame(minWidth:74,minHeight: 24)
                            
                    }
                    .foregroundColor(Color.black)
                    
                   
                    
                    VStack(spacing: 16){
                        TextField("Add Task ..",text: $task)
                            .font(.custom(FontsManager.TurretRoad.medium,size: 20))
                            .padding()
                            .background(Color.white.opacity(0.50))
                            .cornerRadius(16)
                        Button(action:{
                            addItem()
                            // Gecis reklamı
                           
                        }){
                            
                            Spacer()
                            Text("Save")
                                .font(.custom(FontsManager.TurretRoad.medium,size: 25))
                            
                                //.font(.system(.title3 , design: .monospaced))
                            Spacer()
                        }
                        .disabled(isButtonDisabled)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(isButtonDisabled ? Color.red : Color("eggplant") )
                        .cornerRadius(16)
                    }
                    .padding()
                    Spacer()//MESAFE
                    
                    List {
                        ForEach(items) { item in
                            VStack(alignment:.leading) {
                                
                                ListRowItemView(item:item)
                                
                               /*
                                Text(item.task ?? "")
                                    .font(.custom(FontsManager.TurretRoad.medium,size: 20))
                                   // .fontWeight(.bold)
                                    .padding()
                                    
                                
                                Text("Tarih: \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            
                                 */
                                 }
                            
                        
                        }
                        .onDelete(perform: deleteItems)
                        .listRowBackground(Color.white.opacity(0.2))
                        
                        
                    }// List
                    .frame(width: 400, height: 300, alignment: .center)
                    .listStyle(InsetGroupedListStyle())
                    
                    
                }// VSTACK
                
            }// Zstack
            
            .onAppear()
            {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            
            .navigationBarTitle("Check",displayMode: .large)
            .navigationBarHidden(true)
            .background(
                
            )
        
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
        
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
               
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


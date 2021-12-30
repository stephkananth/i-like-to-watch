//
//  MainView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var persistenceVM = PersistenceViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(persistenceVM.items) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        ItemRow(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .onAppear(perform: persistenceVM.updateItems)
            .navigationTitle("watch history")
            .navigationBarItems(trailing: NavigationLink(destination: SearchView(persistenceVM: persistenceVM)) {
                Label("add item", systemImage: "plus")
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            persistenceVM.deleteItem(at: offsets)
        }
    }
}

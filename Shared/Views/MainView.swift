//
//  MainView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            Text("MainView")
                .navigationTitle("watch history")
                .navigationBarItems(trailing: NavigationLink(destination: SearchView()) {
                    Label("add item", systemImage: "plus")
                })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

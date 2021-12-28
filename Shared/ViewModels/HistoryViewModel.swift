//
//  HistoryViewModel.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/27/21.
//

import CoreData
import Foundation

class HistoryViewModel: ObservableObject {
    @Published var items: [NSManagedObject] = []

}

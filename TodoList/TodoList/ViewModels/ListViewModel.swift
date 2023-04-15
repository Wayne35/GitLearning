//
//  ListViewModel.swift
//  TodoList
//
//  Created by HUAHUA on 2022/11/14.
//

import Foundation

class ListViewModel: ObservableObject {
	
	@Published var items :[ItemModel] = [] {
		didSet {
			saveItem()
		}
	}
	
	let itemsKey: String = "items_list"
	
	init() {
		getItems()
	}
	
	func getItems() {
		guard let data = UserDefaults.standard.data(forKey: itemsKey),
			  let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
		else { return }
		
		self.items = savedItem
	}
	
	func deleteItem(indexSet: IndexSet) {
		items.remove(atOffsets: indexSet)
	}
	
	func moveItem(from: IndexSet, to: Int) {
		items.move(fromOffsets: from, toOffset: to)
	}
	
	func addItem(title: String) {
		let newItems = ItemModel(title: title, isCompleted: false)
		items.append(newItems)
	}
	
	func updateItem(item: ItemModel) {
		if let index = items.firstIndex(where: { $0.id == item.id }) {
			items[index] = item.updateCompletion()
		}
	}
	
	func saveItem() {
		if let encodedDate = try? JSONEncoder().encode(items) {
			UserDefaults.standard.set(encodedDate, forKey: itemsKey)
		}
	}
}

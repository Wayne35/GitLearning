//
//  listView.swift
//  TodoList
//
//  Created by HUAHUA on 2022/11/14.
//

import SwiftUI

struct listView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	var body: some View {
		ZStack {
			if listViewModel.items.isEmpty {
				noItemView()
					.transition(AnyTransition.opacity.animation(.linear))
			} else {
				List {
					ForEach(listViewModel.items) { item in
						//ListRowView(title: "\(item.count)")
						ListRowView(item: item)
							.onTapGesture {
								withAnimation(.linear) {
									listViewModel.updateItem(item: item)
								}
							}
					}
					.onDelete(perform: listViewModel.deleteItem)
					.onMove(perform: listViewModel.moveItem)
				}
				.listStyle(.plain)
			}
		}
		
		.navigationTitle("toDoList")
		.navigationBarItems(
			leading: EditButton(),
			trailing: NavigationLink("Add", destination: AddView()))
	}
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			listView()
		}
		.environmentObject(ListViewModel())
	}
}



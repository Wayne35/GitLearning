//
//  TodoListApp.swift
//  TodoList
//
//  Created by HUAHUA on 2022/11/14.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for views
 
 */

@main
struct TodoListApp: App {
	
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				listView()
			}
			.navigationViewStyle(StackNavigationViewStyle())
			.environmentObject(listViewModel)
        }
    }
}

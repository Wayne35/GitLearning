//
//  AddView.swift
//  TodoList
//
//  Created by HUAHUA on 2022/11/14.
//

import SwiftUI

struct AddView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var listViewModel: ListViewModel
	@State var textFieldText: String = ""
	
	@State var alertTitle: String = ""
	@State var showAlert: Bool = false
	
    var body: some View {
		ScrollView {
			VStack {
				TextField("type...", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 55)
					.background(Color(UIColor.secondarySystemBackground))
					.cornerRadius(10)
			
				Button {
					saveButtonPressed()
				} label: {
					Text("Save".uppercased())
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(10)
				}

				
			}
			.padding()
		}
		.navigationTitle("Add an item")
		.alert(isPresented: $showAlert) {
			getAlert()
		}
	}
	
	func saveButtonPressed() {
		if textAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}
	}
	
	func textAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "at least 3 characters"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
	
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			AddView()
		}
		.environmentObject(ListViewModel())
    }
}

//
//  noItemView.swift
//  TodoList
//
//  Created by HUAHUA on 2022/11/15.
//

import SwiftUI

struct noItemView: View {
	
	@State var animate: Bool = false
	let secondaryAccentColor = Color("SecondaryAccentColor")
	
    var body: some View {
		ScrollView {
			VStack(spacing: 10) {
				Text("艾斌实验室")
					.font(.title)
					.fontWeight(.semibold)
				Text("Click the add and add a bunch of items to your list")
					.padding(20)
				NavigationLink(destination: AddView()) {
					Text("点击浏览")
						.foregroundColor(.white)
						.font(.headline)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(animate ? secondaryAccentColor : Color.accentColor)
						.cornerRadius(10)
				}
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(
					color: animate ? secondaryAccentColor.opacity(0.7): Color.accentColor.opacity(0.7),
					radius: animate ? 30 : 10,
					x: 0,
					y: animate ? 50 : 30
				)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
			}
			.frame(maxWidth: 400)
			.multilineTextAlignment(.center)
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	func addAnimation() {
		guard !animate else { return }
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
			withAnimation(
			Animation
				.easeInOut(duration:  2.0)
				.repeatForever()
			) {
				animate.toggle()
			}
		}
	}
	
}

struct noItemView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			noItemView()
				.navigationTitle("title")
		}
    }
}

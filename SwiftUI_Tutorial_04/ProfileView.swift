//
//  ProfileView.swift
//  SwiftUI_Tutorial_04
//
//  Created by SeongMinK on 2021/12/05.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.purple)
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .overlay(
                Text("프로필")
                    .font(.system(size: 25))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
            )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

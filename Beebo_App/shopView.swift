//
//  shopView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 1/8/26.
//

import SwiftUI

struct shopView: View {
    var body: some View {
        VStack(spacing: -100){
            Text("the shop")
            Image("shopkeeper")
                .resizable()
                .frame(width: 300, height: 600)
        }
    }
}

#Preview {
   shopView()
}

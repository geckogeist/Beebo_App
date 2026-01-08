//
//  StartUpView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 11/24/25.
//

//
//  StartUpView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 11/21/25.
//

import SwiftUI

struct StartUpView: View {
    var body: some View {
        VStack(spacing:-15) {
            Image("Beebo_Logo")
                .resizable()
                .frame(width: 250, height: 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lightBlue)
        
    }


        
}

#Preview {
    StartUpView()
}

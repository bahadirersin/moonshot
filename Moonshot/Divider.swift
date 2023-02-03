//
//  Divider.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 3.02.2023.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
            .preferredColorScheme(.dark)
    }
}

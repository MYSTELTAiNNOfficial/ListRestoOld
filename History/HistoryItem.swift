//
//  HistoryItem.swift
//  ListResto
//
//  Created by Syamsuddin Putra Riefli on 23/05/22.
//

import SwiftUI

struct HistoryItem: View {
    var body: some View {
        VStack(alignment:.center){
            Image("Afterwork")
                .renderingMode(.original)
                .resizable()
                .frame(width:100, height: 100)
                .cornerRadius(10)
            Text("After Work")
                .bold()
                .foregroundColor(.brown)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.brown, lineWidth: 2)
        )
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItem()
    }
}

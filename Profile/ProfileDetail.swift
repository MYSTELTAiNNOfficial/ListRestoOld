//
//  ProfileDetail.swift
//  ListResto
//
//  Created by Macbook Pro on 29/05/22.
//

import SwiftUI

struct ProfileDetail: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        Text(modelData.userData.user)
    }
}

struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetail()
            .environmentObject(ModelData())
    }
}

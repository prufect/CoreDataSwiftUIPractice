//
//  UpdateListItemView.swift
//  CoreDataPractice
//
//  Created by Prudhvi Gadiraju on 7/28/20.
//

import SwiftUI

struct UpdateListItemView: View {
    
    @ObservedObject var vm: ListViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Update Here", text: $vm.updateText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: vm.updateData) {
                Text("Update")
            }
        }.padding()
    }
}

struct UpdateListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListItemView(vm: ListViewModel())
    }
}

//
//  ListView.swift
//  CoreDataPractice
//
//  Created by Prudhvi Gadiraju on 7/28/20.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var vm = ListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.data, id: \.objectID) { obj in
                    Text(vm.getValue(for: obj))
                        .onTapGesture { vm.openUpdateView(obj: obj) }
                }.onDelete(perform: vm.deleteData)
            }.listStyle(InsetGroupedListStyle())
            
            HStack {
                TextField("Data here", text: $vm.text)
                Button(action: vm.writeData) {
                    Text("Save")
                }
            }.padding()
        }
        .sheet(isPresented: $vm.isUpdating) {
            UpdateListItemView(vm: vm)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

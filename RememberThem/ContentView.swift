//
//  ContentView.swift
//  RememberThem
//
//  Created by enesozmus on 30.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: ContactsViewModel
    
    /*
        init(wrappedValue:)
            → Creates a new state object with an initial wrapped value.
            → The underlying value referenced by the state object.
     */
    init(vm: ContactsViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.contacts) { contact in
                    NavigationLink {
                        // ...
                    } label: {
                        HStack {
                            contact.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(30)
                            Text(contact.name)
                                .font(.headline)
                        }
                    }
                    .padding(.trailing)
                    .background(.teal.opacity(0.5))
                    .cornerRadius(30)
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: vm.remove)
            }
            .listStyle(.plain)
            .navigationTitle("Friendly Contacts")
            .toolbar {
                Button {
                    vm.showingAddContact = true
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.primary)
            }
            // ...
            .sheet(isPresented: $vm.showingAddContact) {
                AddContactView(contactsVM: vm)
                    .environmentObject(vm)
            }
        }
    }
}

#Preview {
    ContentView(vm: FileContacts())
}

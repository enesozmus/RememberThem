//
//  ContentView.swift
//  RememberThem
//
//  Created by enesozmus on 30.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContactsViewModel
    
    /*
        init(wrappedValue:)
            → Creates a new state object with an initial wrapped value.
            → The underlying value referenced by the state object.
     */
    init(viewModel: ContactsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.contacts) { contact in
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
                .onDelete(perform: viewModel.remove)
            }
            .listStyle(.plain)
            .navigationTitle("Friendly Contacts")
            .toolbar {
                Button {
                    viewModel.showingAddContact = true
                } label: {
                    Image(systemName: "plus")
                }
                .foregroundColor(.primary)
            }
            // ...
        }
    }
}

#Preview {
    ContentView(viewModel: FileContacts())
}

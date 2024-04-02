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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: FileContacts())
}

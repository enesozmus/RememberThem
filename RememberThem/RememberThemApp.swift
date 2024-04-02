//
//  RememberThemApp.swift
//  RememberThem
//
//  Created by enesozmus on 30.03.2024.
//

import SwiftUI

@main
struct RememberThemApp: App {
    private var viewModel: ContactsViewModel = FileContacts();
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}

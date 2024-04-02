//
//  ContactsViewModel.swift
//  RememberThem
//
//  Created by enesozmus on 31.03.2024.
//

import SwiftUI

class ContactsViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    @Published var showingAddContact = false
    @Published var showingPicker = false
    
    func add(contact: Contact) {}
    func remove(at offsets: IndexSet) {}
    func deleteImage(imagePath: String?) {
        ImageUtilities().deleteImage(imagePath: imagePath)
    }
}

/*
 
    SwiftUI Data Flow
 
        → The user interface is a function of the state. That is a foundational principle of SwiftUI.
        → It means that any change in state is automatically reflected in the user interface.
        → SwiftUI makes this possible through a collection of property wrappers, such as @State, @Binding, @StateObject, and @ObservedObject.
        → Each property wrapper plays a clearly defined role in managing and observing the data that flows through your app.
 */


/*
 
    @State:                             → A source of truth for data local to a view
    @Binding:                           → A reference to a source of truth owned by another view
    @StateObject and @ObservedObject:   → It acts as a source of truth for reference types within a SwiftUI view.
 */


/*
     ObservableObject

             class UserProgress: ObservableObject {
                 @Published var score = 0
                 ...
             }

             struct ContentView: View {
                 @StateObject var progress = UserProgress()
                 ...
             }

        → A type of object with a publisher that emits before the object has changed.
        → By default an ObservableObject synthesizes an objectWillChange publisher that emits the changed value before any of its @Published properties changes.

        → When using observed objects there are three key things we need to work with:

            1. the ObservableObject protocol is used with some sort of class that can store data
            2. the @ObservedObject property wrapper is used inside a view to store an observable object instance
            3. and the @Published property wrapper is added to any properties inside an observed object that should cause views to update when they change.

        → The ObservableObject conformance allows instances of this class to be used inside views, so that when important changes happen the view will reload.
        → The @Published property wrapper tells SwiftUI that changes to score should trigger view reloads.
 */


/*
 
    StateObject(struct)
 
        → The StateObject property wrapper was introduced in 2020.
 
        → A property wrapper type that instantiates an observable object.
        → Securely transfer data between views
 
        → SwiftUI’s @StateObject property wrapper is designed to fill a very specific gap in state management:
        → ...when you need to create a reference type inside one of your views and make sure it stays alive for use in that view and others you share it with.

        → Unlike other property wrappers, a StateObject is responsible for both creating and managing the lifecycle of the wrapped object.
        → What does that mean?
        → The object associated with a StateObject persists for the lifetime of the view that owns it.
 
        → You should use the StateObject property wrapper for properties that are (1) initialized once and (2) owned by the view.
 
         → That will make sure the DataModel instance does not get destroyed when the view updates.

             class DataModel: ObservableObject {
                     @Published var ...
                     ...
             }

              struct MyView: View {
                     @StateObject private var model = DataModel()
                     ...
             }
 */


/*
    @Published
 
        → A type that publishes a property marked with an attribute.
        → Publishing a property with the @Published attribute creates a publisher of this type.
 
        → @Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur.
        → SwiftUI will automatically monitor for such changes, and re-invoke the body property of any views that rely on the data.
 
        → If you wanted change announcements to be sent whenever something was added or removed from items, you would mark it with @Published

        → the @Published property wrapper effectively adds a willSet property observer to items, so that any changes are automatically sent out to observers.
        → they won’t force SwiftUI to reload views when they change unless you specifically mark them with @Published.
 */


/*
 
 
    remove(atOffsets:)
        → Removes all the elements at the specified offsets from the collection.
    IndexSet
        → A collection of unique integer values that represent the indexes of elements in another collection.
 */

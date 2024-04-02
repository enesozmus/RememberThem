//
//  FileContacts.swift
//  RememberThem
//
//  Created by enesozmus on 31.03.2024.
//

import Foundation

class FileContacts: ContactsViewModel {
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedContacts.json")
    
    override init() {
        super.init()
        loadData()
    }
    
    func loadData() {
        do {
            // init(contentsOf:)
            // → Creates a data object from the data at the specified file URL.
            let data = try Data(contentsOf: savePath)
            let decoded = try JSONDecoder().decode([Contact].self, from: data)
            contacts = decoded
            contacts.sort()
        } catch {
            contacts = []
        }
    }
    
    override func add(contact: Contact) {
        contacts.append(contact)
        contacts.sort()
        saveData()
    }
    
    override func remove(at offsets: IndexSet) {
        if let index = offsets.first {
            let imagePath = contacts[index].imagePath
            deleteImage(imagePath: imagePath)
        }
        contacts.remove(atOffsets: offsets)
        saveData()
    }
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(contacts)
            try data.write(to: savePath)
        } catch {
            fatalError("Failed to write data to disk: \(error.localizedDescription)")
        }
    }
}


/*
 
    url
        → The location on disk of the data to read
    JSONDecoder()
        → An object that decodes instances of a data type from JSON objects.
    .decode
        → Decoding the result of that data into a Response struct.
        → Returns a value of the type you specify, decoded from a JSON object.
            type → The type of the value to decode from the supplied JSON object.
            data → The JSON object to decode.
 
    JSONEncoder
        → An object that encodes instances of a data type as JSON objects.
    .encode
        → Returns a JSON-encoded representation of the value you supply.
            value → The value to encode as JSON.
 */

//
//  ImageUtils.swift
//  RememberThem
//
//  Created by enesozmus on 30.03.2024.
//

import Foundation

class ImageUtilities {
    
    // ...
    func setImage(imageData: Data) -> String? {
        // let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(UUID().uuidString)
        let url = FileManager.documentsDirectory.appendingPathComponent(UUID().uuidString)
        
        do {
            try imageData.write(to: url, options: [.atomic, .completeFileProtection])
            return url.lastPathComponent
        } catch {
            print("Failed write image data to disk: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    // ...
    func getImage(imagePath: String?) -> Data?{
        guard let imagePath = imagePath else { return nil }
        
        // let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imagePath)
        let url = FileManager.documentsDirectory.appendingPathComponent(imagePath)
        
        if let data = try? Data(contentsOf: url) {
            return data
        }
        
        return nil
    }
    
    // ...
    func deleteImage(imagePath: String?) {
        guard let imagePath = imagePath else { return }
        
        // let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imagePath)
        let url = FileManager.documentsDirectory.appendingPathComponent(imagePath)
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            fatalError("Failed to delete image from \(url): \(error.localizedDescription)")
        }
    }
    
}

/*
 
     Data
     
         → A byte buffer in memory.
         → The Data value type allows simple byte buffers to take on the behavior of Foundation objects.
         → You can filter and sort the content, or compare against other buffers.
         init() → Creates an empty data buffer.
 */


/*
    .appendingPathComponent → Returns a new URL by appending a path component to the original URL.
 
    .uuidString → The UUID represented as a string.
 
    .write(to:options:) → Writes the contents of the data buffer to a location.
             url → The location to write the data into.
             options → Options for writing the data. Default value is [].
                 atomic: An option to write data to an auxiliary file first and then replace the original file with the auxiliary file when the write completes.
                 completeFileProtection: An option to make the file accessible only while the device is unlocked.
          
    .lastPathComponent → The last path component of the URL, or an empty string if the path is an empty string.
 */

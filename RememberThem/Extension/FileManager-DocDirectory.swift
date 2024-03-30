//
//  FileManager-DocDirectory.swift
//  RememberThem
//
//  Created by enesozmus on 31.03.2024.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}

/*
 
    URL
 
        → URL -> A uniform resource locator (URL) is the address of a specific webpage or file (such as video, image, GIF, etc.) on the internet.
        → A value that identifies the location of a resource, such as an item on a remote server or the path to a local file.
        → You can construct URLs and access their parts.
        → the URL is force unwrapped because the app would not work anyway if it isn’t 100% correct so we make sure it is since it’s hard-coded
 */


/*
    FileManager (class)
 
         → A convenient interface to the contents of the file system, and the primary means of interacting with it.
         → A file manager object lets you examine the contents of the file system and make changes to it.
         → The FileManager class provides convenient access to a shared file manager object that is suitable for most types of file-related manipulations.
         → You use it to locate, create, copy, and move files and directories.
         .init() → Initializes a file manager object that is authorized to perform privileged file system operations.
 
        .default → This method always represents the same file manager object.
 
        .urls → Returns an array of URLs for the specified common directory in the requested domains.
 
             func urls(
                 for directory: FileManager.SearchPathDirectory,
                 in domainMask: FileManager.SearchPathDomainMask
             ) -> [URL]

                directory  → The search path directory. The supported values are described in FileManager.SearchPathDirectory.
                domainMask → The file system domain to search. The value for this parameter is one or more of the constants described in FileManager.SearchPathDomainMask.
 */

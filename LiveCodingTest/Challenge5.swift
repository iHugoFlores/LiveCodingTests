//
//  Challenge5.swift
//  LiveCodingTest
//
//  Created by Field Employee on 4/6/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import Foundation

class Person {
    
    var name: String!
    
    init(_ fullName:String) {
        name = fullName
    }
}

class Book {
    
    var title: String!
    var author: String!
    
    init(_ bookTitle: String, _ bookAuthor: String) {
        title = bookTitle
        author = bookAuthor
    }
    
}

// --- Your code goes below this line ---

class Library {
    
    var catalogue = ["ORW": Book("1984", "George Orwell"),
                     "RAY": Book("Fahrenheit 451", "Ray Bradbury")]
    
    var checkedOutBooks = [String: Person]()
    
    func searchByTitle(_ title: String) -> String {
        
        // TODO: This function searches the catalogue dictionary for a title
        //
        // Returns "Available" if the book exists and isn't checked out
        //
        // Returns "Checked out by name" if the book exists and is checked out
        //
        // Returns "Not in catalogue" if the book doesn't exist
        
        var curBookId: String? = nil
        for (bookId, book) in catalogue {
            if book.title == title {
                curBookId = bookId
                break
            }
        }
        
        if curBookId == nil {
            return "Not in catalogue"
        }
        
        if let cPerson = checkedOutBooks[curBookId!] {
            return "Checked out by name \(cPerson.name!)"
        } else {
            return "Available"
        }
    }
    
    func checkOut(_ bookId: String, _ person: Person) -> String {
        
        // TODO: This function adds to the checkedOutBooks dictionary
        //
        // Returns "Error: Book already checked out" if the book is already in the checkedOutBooks dictionary
        //
        // Returns "Successfully checked out" and adds the bookId,person key-value pair if the book doesn't currently exist in the checkedOutbooks dictionary
        //
        // Returns "Book doesn't exist" if the book isn't in the catalogue dictionary
        
        if catalogue[bookId] == nil {
            return "Book doesn't exist"
        }
        
        if checkedOutBooks[bookId] != nil {
            return "Error: Book already checked out"
        }
        
        checkedOutBooks[bookId] = person
        return "Successfully checked out"
    }
    
    func checkIn(_ bookId: String) -> String {
        
        // TODO: This function removes the bookId, person key-value pair from the checkedOutBooks dictionary
        //
        // Returns "Book doesn't exist" if the book isn't in the catalogue dictionary
        //
        // Returns "Error: Can't check-in a book that hasn't been checked out" if the book isn't in the checkedOutBooks dictionary
        //
        // Returns "Successfully checked in"
        
        if catalogue[bookId] == nil {
            return "Book doesn't exist"
        }
        
        if checkedOutBooks[bookId] == nil {
            return "Error: Can't check-in a book that hasn't been checked out"
        }
        
        checkedOutBooks[bookId] = nil
        return "Successfully checked in"
    }
    
}

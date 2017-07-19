//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Genevieve Koffman on 7/18/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation

import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    
    
    static func createNoteObject() -> Note {
        let Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return Note
    }
    static func saveNote() {
        do {
            try managedContext.save() }
        catch let error as NSError {
            print("could not save \(error)")
        }
    }
    static func deleteNoteObject(noteObject: Note) {
        managedContext.delete(noteObject)
        saveNote()
    }
    static func retrieveNotes() -> [Note] {
        let retrieveRequest = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let results = try managedContext.fetch(retrieveRequest)
            return results
        }
        catch let error as NSError {
            print ("Could not fetch \(error)")
        }
        return []
    }
}



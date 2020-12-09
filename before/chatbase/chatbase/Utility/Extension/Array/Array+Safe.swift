//
//  Array+Safe.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import Foundation

// https://www.hackingwithswift.com/example-code/language/how-to-make-array-access-safer-using-a-custom-subscript
extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

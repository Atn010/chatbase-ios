//
//  String+Empty.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import Foundation

// https://useyourloaf.com/blog/empty-strings-in-swift/
extension Optional where Wrapped == String {
  var isBlank: Bool {
    return self?.isBlank ?? true
  }
}


extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}

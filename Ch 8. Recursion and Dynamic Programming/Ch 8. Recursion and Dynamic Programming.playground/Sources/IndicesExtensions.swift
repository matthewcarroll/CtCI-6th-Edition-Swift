//
//  IndicesExtensions.swift
//
//  Created by Matthew Carroll on 2/11/16.
//  Copyright © 2016 Matthew Carroll. All rights reserved.
//

import Foundation


public extension FixedWidthInteger {
    
    func pow(_ n: Self) -> Self {
        let selfInt: Int = numericCast(asStride)
        let nInt: Int = numericCast(n.asStride)
        let result = Darwin.pow(Double(selfInt), Double(nInt))
        return Self.init().advanced(by: numericCast(Int(result)))
    }
    
    private var asStride: Stride {
        return -distance(to: 0)
    }
}

public extension Collection {
    
    var midIndex: Index {
        let mid = distance(from: startIndex, to: endIndex) / 2
        return index(startIndex, offsetBy: mid)
    }
}

public extension Collection {
    
    func longerAndShorterCollections(other: Self) -> (longerCollection: Self, shorterCollection: Self) {
        return count > other.count ? (self, other) : (other, self)
    }
}

public extension BinaryInteger {
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

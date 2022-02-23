//
//  Note+Extensions.swift
//  Mooskine
//
//  Created by Muhammet BOZKURT on 23.02.2022.
//  Copyright © 2022 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Note{
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}

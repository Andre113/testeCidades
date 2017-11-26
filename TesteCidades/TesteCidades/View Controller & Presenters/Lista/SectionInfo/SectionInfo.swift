//
//  SectionInfo.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class SectionInfo: NSObject {
    var itemsInSection: [CidadeModel]
    var sectionTitle: String?
    
    init(itemsInSection: [CidadeModel], sectionTitle: String) {
        self.itemsInSection = itemsInSection
        self.sectionTitle = sectionTitle
    }
}

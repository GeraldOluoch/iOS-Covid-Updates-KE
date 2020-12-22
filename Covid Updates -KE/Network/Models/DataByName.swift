//  DataByName.swift
//  Covid Updates -KE
//  Created by Gerald on 26/11/2020.

import Foundation

struct DataByName : Decodable {
    
    var country:String
    var code:String = ""
    var confirmed:Int
    var recovered:String
    var critical:Int
    var deaths:Int

}

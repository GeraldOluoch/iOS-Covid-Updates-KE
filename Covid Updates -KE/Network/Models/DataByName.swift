//  DataByName.swift
//  Covid Updates -KE
//  Created by Gerald on 26/11/2020.

import Foundation


struct DataByName : Codable {
    
    var coutry:String = "Kenya"
    var code:String = "KE"
    var confirmed:Int
    var recvered:Int
    var critical:Int
    var deaths:Int

}

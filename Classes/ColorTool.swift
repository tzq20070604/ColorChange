//
//  ColorTool.swift
//  YBDDemo
//
//  Created by tangzhiqiang on 2023/5/15.
// 234

import UIKit

let ratio:CGFloat = (1.0 / 255)
public extension UIColor {
    convenience init(hexStr:String) {
        var str = hexStr.trimmingCharacters(in: CharacterSet.whitespaces)
        if str.hasPrefix("#"){
            str = str.trimmingCharacters(in: CharacterSet(["#"]))
        }
        if str.hasPrefix("0x") {
            str.removeSubrange(Range(uncheckedBounds: (lower: str.startIndex, upper: str.index(str.startIndex, offsetBy: 2))))
        }
        let value:Int = Int(str,radix:16) ?? 0
        let red:CGFloat = CGFloat((value >> 16 & 0xFF)) * ratio
        let green:CGFloat = CGFloat(value >> 8 & 0xFF) * ratio
        let blue:CGFloat = CGFloat(value & 0xFF) * ratio
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

//
//  Item.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-21.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
   
    let number: Int
    let id: UUID = UUID()
    let color: Color = .gray
    let midiNoteNumber = [ 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 60, 59, 58, 57, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 56, 55, 54, 53, 52, 51, 50, 70, 69, 68, 67, 66, 65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 55, 75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 65, 64, 63, 62, 61, 60, 80, 79, 78, 77, 76, 75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 65 ]
    
    
    var noteNames = [ "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "D♯4", "E4", "F4", "F♯4", "G4", "G♯4", "A4", "A♯4", "B4", "C5", "C♯5", "D5", "D♯5", "E5", "F5", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "D♯4", "E4", "F4", "F♯4", "G4", "G♯4", "A4", "A♯4", "B4", "C5", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "D♯4", "E4", "F4", "F♯4", "G4", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "E1", "F1", "F♯1", "G1", "G♯1", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "B0", "C1", "C♯1", "D1", "D♯1", "E1", "F1", "F♯1", "G1", "G♯1", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "F♯0", "G0", "G♯0", "A0", "A♯0", "B0", "C1", "C♯1", "D1", "D♯1", "E1", "F1", "F♯1", "G1", "G♯1", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2" ]
    
    var shortNoteNames = [ "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "D♯4", "E4", "F4", "F♯4", "G4", "G♯4", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "B3", "C4", "C♯4", "D4", "D♯4", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "F♯3", "G3", "G♯3", "A3", "A♯3", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "C♯3", "D3", "D♯3", "E3", "F3", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "G♯2", "A2", "A♯2", "B2", "C3", "E1", "F1", "F♯1", "G1", "G♯1", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "D♯2", "E2", "F2", "F♯2", "G2", "B0", "C1", "C♯1", "D1", "D♯1", "E1", "F1", "F♯1", "G1", "G♯1", "A1", "A♯1", "B1", "C2", "C♯2", "D2", "F♯0", "G0", "G♯0", "A0", "A♯0", "B0", "C1", "C♯1", "D1", "D♯1", "E1", "F1", "F♯1", "G1", "G♯1", "A1"]

}


// let noteNames: [UInt8: String] = [0: "C-2", 1: "C#-2", 2: "D-2", 3: "D#-2", 4: "E-2", 5: "F-2", 6: "F#-2", 7: "G-2", 8: "G#-2", 9: "A-2", 10: "A#-2", 11: "B-2", 12: "C1", 13: "C♯1", 14: "D1", 15: "D♯1", 16: "E-1", 17: "F-1", 18: "F#-1", 19: "G-1", 20: "G#-1", 21: "A-1", 22: "A#-1", 23: "B-1", 24: "C0", 25: "C#-0", 26: "D-0", 27: "D♯0", 28: "E0", 29: "F0", 30: "F♯0", 31: "G0", 32: "G♯0", 33: "A0", 34: "A♯0", 35: "B0", 36: "C1", 37: "C♯1", 38: "D1", 39: "D♯1", 40: "E1", 41: "F1", 42: "F♯1", 43: "G1", 44: "G♯1", 45: "A1", 46: "A♯1", 47: "B1", 48: "C2", 49: "C♯2", 50: "D2", 51: "D♯2", 52: "E2", 53: "F2", 54: "F♯2", 55: "G2", 56: "G♯2", 57: "A2", 58: "A♯2", 59: "B2", 60: "C3", 61: "C♯3", 62: "D3", 63: "D♯3", 64: "E3", 65: "F3", 66: "F♯3", 67: "G3", 68: "G♯3", 69: "A3", 70: "A♯3", 71: "B3", 72: "C4", 73: "C♯4", 74: "D4", 75: "D♯4", 76: "E4", 77: "F4", 78: "F♯4", 79: "G4", 80: "G♯4", 81: "A4", 82: "A♯4", 83: "B4", 84: "C5", 85: "C♯5", 86: "D5", 87: "D♯5", 88: "E5", 89: "F5", 90: "F♯5", 91: "G5", 92: "G♯5", 93: "A5", 94: "A♯5", 95: "B5", 96: "C6", 97: "C♯6", 98: "D6", 99: "D♯6", 100: "E6", 101: "F6", 102: "F♯6", 103: "G6", 104: "G♯6", 105: "A6", 106: "A♯6", 107: "B6", 108: "C7", 109: "C♯7", 110: "D7", 111: "D♯7", 112: "E7", 113: "F7", 114: "F♯7", 115: "G7", 116: "G♯7", 117: "A7", 118: "A♯7", 119: "B7", 120: "C8", 121: "C♯8", 122: "D8", 123: "D♯8", 124: "E8", 125: "F8", 126: "F♯8", 127: "G8"]
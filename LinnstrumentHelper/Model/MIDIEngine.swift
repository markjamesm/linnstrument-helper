//
//  MIDIEngine.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-26.
//  Copyright © 2020 Mark-James M. All rights reserved.
//  https://markjames.dev
//

import Foundation

struct MIDIEngine {
    
    // Method to convert MIDI note numbers into music notes and print the result.
    func midiToNote(noteNumber: UInt8) -> String {
        let noteNames: [UInt8: String] = [0: "C-2", 1: "C#-2", 2: "D-2", 3: "D#-2", 4: "E-2", 5: "F-2", 6: "F#-2", 7: "G-2", 8: "G#-2", 9: "A-2", 10: "A#-2", 11: "B-2", 12: "C1", 13: "C#1", 14: "D1", 15: "D#1", 16: "E-1", 17: "F-1", 18: "F#-1", 19: "G-1", 20: "G#-1", 21: "A-1", 22: "A#-1", 23: "B-1", 24: "C0", 25: "C#-0", 26: "D-0", 27: "D#0", 28: "E0", 29: "F0", 30: "F#0", 31: "G0", 32: "G#0", 33: "A0", 34: "A#0", 35: "B0", 36: "C1", 37: "C#1", 38: "D1", 39: "D#1", 40: "E1", 41: "F1", 42: "F#1", 43: "G1", 44: "G#1", 45: "A1", 46: "A#1", 47: "B1", 48: "C2", 49: "C#2", 50: "D2", 51: "D#2", 52: "E2", 53: "F2", 54: "F#2", 55: "G2", 56: "G#2", 57: "A2", 58: "A#2", 59: "B2", 60: "C3", 61: "C#3", 62: "D3", 63: "D#3", 64: "E3", 65: "F3", 66: "F#3", 67: "G3", 68: "G#3", 69: "A3", 70: "A#3", 71: "B3", 72: "C4", 73: "C#4", 74: "D4", 75: "D#4", 76: "E4", 77: "F4", 78: "F#4", 79: "G4", 80: "G#4", 81: "A4", 82: "A#4", 83: "B4", 84: "C5", 85: "C#5", 86: "D5", 87: "D#5", 88: "E5", 89: "F5", 90: "F#5", 91: "G5", 92: "G#5", 93: "A5", 94: "A#5", 95: "B5", 96: "C6", 97: "C#6", 98: "D6", 99: "D#6", 100: "E6", 101: "F6", 102: "F#6", 103: "G6", 104: "G#6", 105: "A6", 106: "A#6", 107: "B6", 108: "C7", 109: "C#7", 110: "D7", 111: "D#7", 112: "E7", 113: "F7", 114: "F#7", 115: "G7", 116: "G#7", 117: "A7", 118: "A#7", 119: "B7", 120: "C8", 121: "C#8", 122: "D8", 123: "D#8", 124: "E8", 125: "F8", 126: "F#8", 127: "G8"]

        return noteNames[noteNumber] ?? "?"
    }

    //-----------------------------------------
    // LS 200 
    //-----------------------------------------

    func midiToGrid(noteNumber: UInt8) -> Int {
        let grid: [UInt8: UInt8] = [ 30: 175, 31: 176, 32: 177, 33: 178, 34: 179, 35: 180, 36: 181, 37: 182, 38: 183, 39: 184, 40: 185, 41: 186, 42: 187, 43: 188, 44: 189, 45: 190, 46: 191, 47: 192, 48: 193, 49: 194, 50: 195, 51: 196, 52: 197, 53: 198, 54: 199, 55: 170, 56: 171, 57: 172, 58: 173, 59: 174, 60: 145, 61: 146, 62: 147, 63: 148, 64: 149, 65: 120, 66: 121, 67: 122, 68: 123, 69: 124, 70: 95, 71: 96, 72: 97, 73: 98, 74: 99, 75: 70, 76: 71, 77: 72, 78: 73, 79: 74, 80: 45, 81: 46, 82: 47, 83: 48, 84: 49, 85: 20, 86: 21, 87: 22, 88: 23, 89: 24 ]

        return Int(grid[noteNumber] ?? 0)
    }
    
    // Displays all the notes for the .overlayPreferenceValues
    func mapGridNotes(note: UInt8?) -> [Int] {

        switch note {
        case 30:
            return [175]
        case 31:
            return [176]
        case 32:
            return [177]
        case 33:
            return [178]
        case 34:
            return [179]
        case 35:
            return [180]
        case 36:
            return [181, 151]
        case 37:
            return [182, 152]
        case 38:
            return [183, 153]
        case 39:
            return [184, 154]
        case 40:
            return [185, 155, 125]
        case 41:
            return [186, 156, 126]
        case 42:
            return [187, 157, 127]
        case 43:
            return [188, 158, 128]
        case 44:
            return [189, 159, 129]
        case 45:
            return [190, 160, 130, 100]
        case 46:
            return [191, 161, 131, 101]
        case 47:
            return [192, 162, 132, 102]
        case 48:
            return [193, 163, 133, 103]
        case 49:
            return [194, 164, 134, 104]
        case 50:
            return [195, 165, 135, 105, 75]
        case 51:
            return [196, 166, 136, 106, 76]
        case 52:
            return [197, 167, 137, 107, 77]
        case 53:
            return [198, 168, 138, 108, 78]
        case 54:
            return [199, 169, 139, 109, 79]
        case 55:
            return [170, 140, 110, 80, 50]
        case 56:
            return [171, 141, 111, 81, 51]
        case 57:
            return [172, 142, 112, 82, 52]
        case 58:
            return [173, 143, 113, 83, 53]
        case 59:
            return [174, 144, 115, 84, 54]
        case 60:
            return [145, 115, 85, 25]
        case 61:
            return [146, 116, 86, 26]
        case 62:
            return [147, 117, 87, 27]
        case 63:
            return [148, 118, 88, 28]
        case 64:
            return [149, 119, 89, 29]
        case 65:
            return [120, 90, 60, 30, 0]
        case 66:
            return [121, 91, 61, 31, 1]
        case 67:
            return [122, 92, 62, 32, 2]
        case 68:
            return [123, 93, 63, 33, 3]
        case 69:
            return [124, 94, 64, 34, 4]
        case 70:
            return [95, 65, 35, 5]
        case 71:
            return [96, 66, 36, 6]
        case 72:
            return [97, 67, 37, 7]
        case 73:
            return [98, 68, 38, 8]
        case 74:
            return [99, 69, 39, 9]
        case 75:
            return [70, 40, 10]
        case 76:
            return [71, 41, 11]
        case 77:
            return [72, 42, 12]
        case 78:
            return [73, 43, 13]
        case 79:
            return [74, 44, 14]
        case 80:
            return [45, 15]
        case 81:
            return [46, 16]
        case 82:
            return [47, 17]
        case 83:
            return [48, 18]
        case 84:
            return [49, 19]
        case 85:
            return [20]
        case 86:
            return [21]
        case 87:
            return [22]
        case 88:
            return [23]
        case 89:
            return [24]
        default:
            return []
        }
    }

    //-----------------------------------------
    // LS 128
    //-----------------------------------------

    func midiToSmallGrid(noteNumber: UInt8) -> Int {
        let smallGrid: [UInt8: UInt8] = [ 30: 112, 31: 113, 32: 114, 33: 115, 34: 116, 35: 117, 36: 118, 37: 119, 38: 120, 39: 121, 40: 122, 41: 123, 42: 124, 43: 125, 44: 126, 45: 127, 46: 86, 47: 87, 48: 88, 49: 89, 50: 90, 51: 91, 52: 92, 53: 93, 54: 94, 55: 95, 56: 75, 57: 76, 58: 77, 59: 78, 60: 79, 61: 59, 62: 60, 63: 61, 64: 62, 65: 63, 66: 43, 67: 44, 68: 45, 69: 46, 70: 47, 71: 27, 72: 28, 73: 29, 74: 30, 75: 31, 76: 11, 77: 12, 78: 13, 79: 14, 80: 15 ]

        return Int(smallGrid[noteNumber] ?? 0)
    }

    // Displays all the notes for the .overlayPreferenceValues
    func mapSmallGridNotes(note: UInt8?) -> [Int] {

        switch note {
        case 30:
            return [112]
        case 31:
            return [113]
        case 32:
            return [114]
        case 33:
            return [115]
        case 34:
            return [116]
        case 35:
            return [117, 96]
        case 36:
            return [118, 97]
        case 37:
            return [119, 98]
        case 38:
            return [120, 99]
        case 39:
            return [121, 100]
        case 40:
            return [122, 101, 80]
        case 41:
            return [123, 102, 81]
        case 42:
            return [124, 103, 82]
        case 43:
            return [125, 104, 83]
        case 44:
            return [126, 105, 84]
        case 45:
            return [127, 106, 85, 64]
        case 46:
            return [86, 65, 107]
        case 47:
            return [87, 108, 66]
        case 48:
            return [88, 67]
        case 49:
            return [89, 68]
        case 50:
            return [90, 69, 48]
        case 51:
            return [91, 70, 49]
        case 52:
            return [92, 71, 50]
        case 53:
            return [93, 72, 51]
        case 54:
            return [94, 73, 52]
        case 55:
            return [95, 74, 53, 32]
        case 56:
            return [75, 54, 33]
        case 57:
            return [76, 55, 34]
        case 58:
            return [77, 56, 35]
        case 59:
            return [78, 57]
        case 60:
            return [79, 58, 37, 16]
        case 61:
            return [59, 38, 17]
        case 62:
            return [60, 39, 18]
        case 63:
            return [61, 40, 19]
        case 64:
            return [62, 41, 20]
        case 65:
            return [63, 42, 21, 0]
        case 66:
            return [43, 22, 1]
        case 67:
            return [44, 23, 2]
        case 68:
            return [45, 24, 3]
        case 69:
            return [46, 25, 4]
        case 70:
            return [47, 26, 5]
        case 71:
            return [27, 6]
        case 72:
            return [28, 7]
        case 73:
            return [29, 8]
        case 74:
            return [30, 9]
        case 75:
            return [10]
        case 76:
            return [11]
        case 77:
            return [12]
        case 78:
            return [13]
        case 79:
            return [14]
        case 80:
            return [15]
        default:
            return []
        }
    }

}

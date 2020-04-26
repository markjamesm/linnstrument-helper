//
//  AudioEngine.swift
//  LinnstrumentHelper
//
//  Created by Mark-James McDougall on 2020-04-20.
//  Copyright © 2020 Mark-James M. All rights reserved.
//

import Foundation
import AudioKit
import Combine

class Conductor: AKMIDIListener, ObservableObject {
    
    @Published var noteNumber: UInt8 = 0
    @Published var note1: UInt8 = 0
    @Published var note2: UInt8 = 0
    @Published var note3: UInt8 = 0
    @Published var note4: UInt8 = 0
    @Published var note5: UInt8 = 0
    @Published var smallNote1GridPos: UInt8 = 0
    @Published var smallNote2GridPos: UInt8 = 0
    @Published var smallNote3GridPos: UInt8 = 0
    @Published var smallNote4GridPos: UInt8 = 0
    @Published var smallNote5GridPos: UInt8 = 0
    @Published var lastNote: UInt8 = 0
    @Published var noteOneName: String = " "
    @Published var noteTwoName: String = " "
    @Published var noteThreeName: String = " "
    @Published var noteFourName: String = " "
    @Published var noteFiveName: String = " "
    @Published var notesHeld: Array<UInt8> = [0]
    @Published var noteNames: Array<UInt8> = [0]
    @Published var noteOnePressed: Bool
    @Published var noteTwoPressed: Bool
    @Published var noteThreePressed: Bool
    @Published var noteFourPressed: Bool
    @Published var noteFivePressed: Bool
    @Published var velocity: UInt8 = 0
    @Published var channel: UInt8 = 0
    
    
    static let sharedInstance = Conductor()
    
    let midi = AudioKit.midi
    
    let synth = AKSynth(masterVolume: 0.5, pitchBend: 0.0, vibratoDepth: 0.0, filterCutoff: 2.0, filterStrength: 0.5, filterResonance: 0.0, attackDuration: 0.1, decayDuration: 0.0, sustainLevel: 1.0, releaseDuration: 0.2, filterEnable: true)
    
    var mixer = AKMixer()
    
    init() {
        
        self.noteOnePressed = false
        self.noteTwoPressed = false
        self.noteThreePressed = false
        self.noteFourPressed = false
        self.noteFivePressed = false
        
        midi.openInput(name: "Session 1")
        midi.addListener(self)
        
        mixer = AKMixer(synth)
        AudioKit.output = mixer
           try! AudioKit.start()
    }
    
    func receivedMIDINoteOn(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {
        
        DispatchQueue.main.async {
          //  self.noteNumber = noteNumber
         //   print(noteNumber)
        //    self.lastNote = noteNumber
            
            
            self.notesHeld.insert(UInt8(self.midiToSmallGrid(noteNumber: noteNumber)), at: self.notesHeld.endIndex)
            
            self.smallNote1GridPos = self.notesHeld.dropFirst(1).first ?? 0
            self.smallNote2GridPos = self.notesHeld.dropFirst(2).first ?? 0
            self.smallNote3GridPos = self.notesHeld.dropFirst(3).first ?? 0
            self.smallNote4GridPos = self.notesHeld.dropFirst(4).first ?? 0
            self.smallNote5GridPos = self.notesHeld.dropFirst(5).first ?? 0
        
            self.noteNames.insert(noteNumber, at: self.noteNames.endIndex)
          //  print(self.notesHeld)
        //    self.isNotePressed = true
            
            self.playNote(noteNumber: noteNumber, velocity: velocity)
            
            self.velocity = velocity
            self.channel = channel + 1
          //  self.noteGrid = self.midiToSmallGrid(noteNumber: noteNumber)
            self.note1 = self.noteNames.dropFirst(1).first ?? 0
            self.note2 = self.noteNames.dropFirst(2).first ?? 0
            self.note3 = self.noteNames.dropFirst(3).first ?? 0
            self.note4 = self.noteNames.dropFirst(4).first ?? 0
            self.note5 = self.noteNames.dropFirst(5).first ?? 0
            
            self.noteOnePressed = true
            self.noteTwoPressed = true
            self.noteThreePressed = true
            self.noteFourPressed = true
            self.noteFivePressed = true
            
            self.noteOneName = self.midiToNote(noteNumber: self.note1)
            self.noteTwoName = self.midiToNote(noteNumber: self.note2)
            self.noteThreeName = self.midiToNote(noteNumber: self.note3)
            self.noteFourName = self.midiToNote(noteNumber: self.note4)
            self.noteFiveName = self.midiToNote(noteNumber: self.note5)
            print(self.note1)
            print(self.note2)
            
           // print(self.note1, self.note2, self.note3)
        }
    }

    func receivedMIDINoteOff(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {
        
        DispatchQueue.main.async {
            self.noteNumber = 0
            self.notesHeld.removeLast()
            self.noteNames.removeLast()
            self.noteOnePressed = false
       //     self.noteOneName = " "
            
            self.stopNote(noteNumber: noteNumber)
           // self.velocity = 0
            self.note1 = 0
            self.note2 = 0
            self.note3 = 0
            self.note4 = 0
            
            self.smallNote1GridPos = 0
            self.smallNote2GridPos = 0
            self.smallNote3GridPos = 0
            self.smallNote4GridPos = 0
            self.smallNote5GridPos = 0
            
            self.noteOnePressed = false
            self.noteTwoPressed = false
            self.noteThreePressed = false
            self.noteFourPressed = false
            self.noteFivePressed = false
        }
    }

    // Method to convert MIDI note numbers into music notes and print the result.
    func midiToNote(noteNumber: UInt8) -> String {
        let noteNames: [UInt8: String] = [0: "C-2", 1: "C#-2", 2: "D-2", 3: "D#-2", 4: "E-2", 5: "F-2", 6: "F#-2", 7: "G-2", 8: "G#-2", 9: "A-2", 10: "A#-2", 11: "B-2", 12: "C1", 13: "C#1", 14: "D1", 15: "D#1", 16: "E-1", 17: "F-1", 18: "F#-1", 19: "G-1", 20: "G#-1", 21: "A-1", 22: "A#-1", 23: "B-1", 24: "C0", 25: "C#-0", 26: "D-0", 27: "D#0", 28: "E0", 29: "F0", 30: "F#0", 31: "G0", 32: "G#0", 33: "A0", 34: "A#0", 35: "B0", 36: "C1", 37: "C#1", 38: "D1", 39: "D#1", 40: "E1", 41: "F1", 42: "F#1", 43: "G1", 44: "G#1", 45: "A1", 46: "A#1", 47: "B1", 48: "C2", 49: "C#2", 50: "D2", 51: "D#2", 52: "E2", 53: "F2", 54: "F#2", 55: "G2", 56: "G#2", 57: "A2", 58: "A#2", 59: "B2", 60: "C3", 61: "C#3", 62: "D3", 63: "D#3", 64: "E3", 65: "F3", 66: "F#3", 67: "G3", 68: "G#3", 69: "A3", 70: "A#3", 71: "B3", 72: "C4", 73: "C#4", 74: "D4", 75: "D#4", 76: "E4", 77: "F4", 78: "F#4", 79: "G4", 80: "G#4", 81: "A4", 82: "A#4", 83: "B4", 84: "C5", 85: "C#5", 86: "D5", 87: "D#5", 88: "E5", 89: "F5", 90: "F#5", 91: "G5", 92: "G#5", 93: "A5", 94: "A#5", 95: "B5", 96: "C6", 97: "C#6", 98: "D6", 99: "D#6", 100: "E6", 101: "F6", 102: "F#6", 103: "G6", 104: "G#6", 105: "A6", 106: "A#6", 107: "B6", 108: "C7", 109: "C#7", 110: "D7", 111: "D#7", 112: "E7", 113: "F7", 114: "F#7", 115: "G7", 116: "G#7", 117: "A7", 118: "A#7", 119: "B7", 120: "C8", 121: "C#8", 122: "D8", 123: "D#8", 124: "E8", 125: "F8", 126: "F#8", 127: "G8"]

        return noteNames[noteNumber]!
    }
    
    
    // LS 200
    
    func midiToGrid(noteNumber: UInt8) -> Int {
    let grid: [UInt8: UInt8] = [ 30: 112, 31: 113, 32: 114, 33: 115, 34: 116, 35: 117, 36: 118, 37: 119, 38: 120, 39: 121, 40: 122, 41: 123, 42: 124, 43: 125, 44: 126, 45: 127, 46: 86, 47: 87, 48: 88, 49: 89, 50: 90, 51: 91, 52: 92, 53: 93, 54: 94, 55: 95, 56: 75, 57: 76, 58: 77, 59: 78, 60: 79, 61: 59, 62: 60, 63: 61, 64: 62, 65: 63, 66: 43, 67: 44, 68: 45, 69: 46, 70: 47, 71: 27, 72: 28, 73: 29, 74: 30, 75: 31, 76: 11, 77: 12, 78: 13, 79: 14, 80: 15, 190: 190 ]
    
        return Int(grid[noteNumber]!)
    }
        
   // LS 128
        
    func midiToSmallGrid(noteNumber: UInt8) -> Int {
        let smallGrid: [UInt8: UInt8] = [ 30: 112, 31: 113, 32: 114, 33: 115, 34: 116, 35: 117, 36: 118, 37: 119, 38: 120, 39: 121, 40: 122, 41: 123, 42: 124, 43: 125, 44: 126, 45: 127, 46: 86, 47: 87, 48: 88, 49: 89, 50: 90, 51: 91, 52: 92, 53: 93, 54: 94, 55: 95, 56: 75, 57: 76, 58: 77, 59: 78, 60: 79, 61: 59, 62: 60, 63: 61, 64: 62, 65: 63, 66: 43, 67: 44, 68: 45, 69: 46, 70: 47, 71: 27, 72: 28, 73: 29, 74: 30, 75: 31, 76: 11, 77: 12, 78: 13, 79: 14, 80: 15, 190: 190 ]
     
        return Int(smallGrid[noteNumber]!)
   }
    
        
    // Synth Engine Methods
        
    func playNote(noteNumber: UInt8, velocity: UInt8) {
         synth.play(noteNumber: noteNumber, velocity: velocity)
       }

       func stopNote(noteNumber: UInt8) {
         synth.stop(noteNumber: noteNumber)
       }
    
}

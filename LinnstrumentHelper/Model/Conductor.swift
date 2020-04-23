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
    @Published var lastNote: UInt8 = 0
    @Published var noteName: String = " "
    @Published var notesHeld: Array<UInt8> = []
    @Published var isNotePressed: Bool
    
    static let sharedInstance = Conductor()
    
    let midi = AudioKit.midi
    
    let synth = AKSynth(masterVolume: 0.5, pitchBend: 0.0, vibratoDepth: 0.0, filterCutoff: 2.0, filterStrength: 0.5, filterResonance: 0.0, attackDuration: 0.1, decayDuration: 0.0, sustainLevel: 1.0, releaseDuration: 0.2, filterEnable: true)
    
    var mixer = AKMixer()
    
    init() {
        
        self.isNotePressed = false
        
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

    //    print("Playing MIDI note number: \(noteNumber)")
        
        DispatchQueue.main.async {
            self.noteNumber = noteNumber
            self.lastNote = noteNumber
            self.notesHeld.insert(noteNumber, at: self.notesHeld.endIndex)
          //  print(self.notesHeld)
            self.isNotePressed = true
            self.noteName = self.midiToNote(noteNumber: self.noteNumber)
            self.playNote(noteNumber: noteNumber, velocity: velocity)

        }
    }

    func receivedMIDINoteOff(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {
        
        DispatchQueue.main.async {
            self.noteNumber = 0
      //      self.notesHeld.removeLast()
            print(self.notesHeld)
            self.isNotePressed = false
            self.noteName = " "
            self.stopNote(noteNumber: noteNumber)
        }
        // print("Stop") - Use for debugging purposes.
   //     synthEngine.stopNote(noteNumber: noteNumber)
    }

    // Method to convert MIDI note numbers into music notes and print the result.

    func midiToNote(noteNumber: UInt8) -> String {
        let noteNames: [UInt8: String] = [0: "C2", 1: "C#-2", 2: "D-2", 3: "D#-2", 4: "E-2", 5: "F-2", 6: "F#-2", 7: "G-2", 8: "G#-2", 9: "A-2", 10: "A#-2", 11: "B-2", 12: "C1", 13: "C#1", 14: "D1", 15: "D#1", 16: "E-1", 17: "F-1", 18: "F#-1", 19: "G-1", 20: "G#-1", 21: "A-1", 22: "A#-1", 23: "B-1", 24: "C0", 25: "C#-0", 26: "D-0", 27: "D#0", 28: "E0", 29: "F0", 30: "F#0", 31: "G0", 32: "G#0", 33: "A0", 34: "A#0", 35: "B0", 36: "C1", 37: "C#1", 38: "D1", 39: "D#1", 40: "E1", 41: "F1", 42: "F#1", 43: "G1", 44: "G#1", 45: "A1", 46: "A#1", 47: "B1", 48: "C2", 49: "C#2", 50: "D2", 51: "D#2", 52: "E2", 53: "F2", 54: "F#2", 55: "G2", 56: "G#2", 57: "A2", 58: "A#2", 59: "B2", 60: "C3", 61: "C#3", 62: "D3", 63: "D#3", 64: "E3", 65: "F3", 66: "F#3", 67: "G3", 68: "G#3", 69: "A3", 70: "A#3", 71: "B3", 72: "C4", 73: "C#4", 74: "D4", 75: "D#4", 76: "E4", 77: "F4", 78: "F#4", 79: "G4", 80: "G#4", 81: "A4", 82: "A#4", 83: "B4", 84: "C5", 85: "C#5", 86: "D5", 87: "D#5", 88: "E5", 89: "F5", 90: "F#5", 91: "G5", 92: "G#5", 93: "A5", 94: "A#5", 95: "B5", 96: "C6", 97: "C#6", 98: "D6", 99: "D#6", 100: "E6", 101: "F6", 102: "F#6", 103: "G6", 104: "G#6", 105: "A6", 106: "A#6", 107: "B6", 108: "C7", 109: "C#7", 110: "D7", 111: "D#7", 112: "E7", 113: "F7", 114: "F#7", 115: "G7", 116: "G#7", 117: "A7", 118: "A#7", 119: "B7", 120: "C8", 121: "C#8", 122: "D8", 123: "D#8", 124: "E8", 125: "F8", 126: "F#8", 127: "G8"]

        return noteNames[noteNumber]!
    }
    
    func playNote(noteNumber: UInt8, velocity: UInt8) {
         synth.play(noteNumber: noteNumber, velocity: velocity)
       }

       func stopNote(noteNumber: UInt8) {
         synth.stop(noteNumber: noteNumber)
       }
    
}


// [0: "F#0", 31: "G0", 32: "G#0", 33: "A0", 34: "A#0", 35: "B0", 36: "C1", 37: "C#1", 38: "D1", 39: "D#1", 40: "E1", 41: "F1", 42: "F#1", 43: "G1", 44: "G#1", 45: "A1", 46: "A#1", 47: "B1", 48: "C2", 49: "C#2", 50: "D2", 51: "D#2", 52: "E2", 53: "F2", 54: "F#2", 55: "G2", 56: "G#2", 57: "A2", 58: "A#2", 59: "B2", 60: "C3", 61: "C#3", 62: "D3", 63: "D#3", 64: "E3", 65: "F3", 66: "F#3", 67: "G3", 68: "G#3", 69: "A3", 70: "A#3", 71: "B3", 72: "C4", 73: "C#4", 74: "D4", 75: "D#4", 76: "E4", 77: "F4", 78: "F#4", 79: "G4", 80: "G#4", 81: "A4", 82: "A#4", 83: "B4", 84: "C5", 85: "C#5", 86: "D5", 87: "D#5", 88: "E5", 89: "F5"]

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
    @Published var notesHeld: Set<UInt8> = []
    
    static let sharedInstance = Conductor()
    
    let midi = AudioKit.midi
    
    init() {
        
        midi.openInput(name: "Session 1")

        midi.addListener(self)
        print("MIDI ready")
    
    }
    
    func receivedMIDINoteOn(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {

        print("Playing MIDI note number: \(noteNumber)")
        
        DispatchQueue.main.async {
            self.noteNumber = noteNumber
            self.notesHeld.insert(noteNumber)
            print(self.notesHeld)
        }
        
    //    synthEngine.playNote(noteNumber: noteNumber, velocity: velocity)
     //   noteCount += 1
        //print("Notecount: \(noteCount)")
    //    MIDIEngine.midiToNote(noteNumber: noteNumber)

        }

    func receivedMIDINoteOff(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {
        
        DispatchQueue.main.async {
            self.noteNumber = 0
            self.notesHeld.remove(noteNumber)
            print(self.notesHeld)
        }

        // print("Stop") - Use for debugging purposes.
   //     synthEngine.stopNote(noteNumber: noteNumber)
    }

    
}

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

    @Published var noteNumber: UInt8? = nil
    @Published var note1: UInt8? = nil
    @Published var note2: UInt8? = nil
    @Published var note3: UInt8? = nil
    @Published var note4: UInt8? = nil
    @Published var note5: UInt8? = nil
    @Published var smallNote1GridPos: UInt8? = nil
    @Published var smallNote2GridPos: UInt8? = nil
    @Published var smallNote3GridPos: UInt8? = nil
    @Published var smallNote4GridPos: UInt8? = nil
    @Published var smallNote5GridPos: UInt8? = nil
    @Published var lastNote: UInt8 = 0
    @Published var noteOneName: String = " "
    @Published var noteTwoName: String = " "
    @Published var noteThreeName: String = " "
    @Published var noteFourName: String = " "
    @Published var noteFiveName: String = " "
    @Published var notesHeld: [UInt8] = [0]
    @Published var noteNames: [UInt8] = [0]
    @Published var noteOnePressed: Bool
    @Published var noteTwoPressed: Bool
    @Published var noteThreePressed: Bool
    @Published var noteFourPressed: Bool
    @Published var noteFivePressed: Bool
    @Published var velocity: UInt8 = 0
    @Published var channel: UInt8 = 0

    static let sharedInstance = Conductor()

    let midi = AudioKit.midi
    let midiEngine = MIDIEngine()

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

            // Publish aome MIDI data
            self.velocity = velocity
            self.channel = channel + 1
            
            
            //-----------------------------------------
            // Grid mappings
            //-----------------------------------------
            
            self.notesHeld.insert(UInt8(self.midiEngine.midiToSmallGrid(noteNumber: noteNumber)), at: self.notesHeld.endIndex)

            self.smallNote1GridPos = self.notesHeld.dropFirst(1).first ?? nil
            self.smallNote2GridPos = self.notesHeld.dropFirst(2).first ?? nil
            self.smallNote3GridPos = self.notesHeld.dropFirst(3).first ?? nil
            self.smallNote4GridPos = self.notesHeld.dropFirst(4).first ?? nil
            self.smallNote5GridPos = self.notesHeld.dropFirst(5).first ?? nil

            self.noteNames.insert(noteNumber, at: self.noteNames.endIndex)
            
            self.note1 = self.noteNames.dropFirst(1).first ?? nil
            self.note2 = self.noteNames.dropFirst(2).first ?? nil
            self.note3 = self.noteNames.dropFirst(3).first ?? nil
            self.note4 = self.noteNames.dropFirst(4).first ?? nil
            self.note5 = self.noteNames.dropFirst(5).first ?? nil
            
            self.noteOneName = self.note1 != nil ? self.midiEngine.midiToNote(noteNumber: self.note1!) : ""
            self.noteTwoName = self.note2 != nil ? self.midiEngine.midiToNote(noteNumber: self.note2!) : ""
            self.noteThreeName = self.note3 != nil ? self.midiEngine.midiToNote(noteNumber: self.note3!) : ""
            self.noteFourName = self.note4 != nil ? self.midiEngine.midiToNote(noteNumber: self.note4!) : ""
            // self.noteFiveName = self.midiEngine.midiToNote(noteNumber: self.note5 ?? 0)

            self.noteOnePressed = true
            self.noteTwoPressed = true
            self.noteThreePressed = true
            self.noteFourPressed = true
            self.noteFivePressed = true
            
            
            //-----------------------------------------
            // Synth methods
            //-----------------------------------------
            
            self.playNote(noteNumber: noteNumber, velocity: velocity)
        }
    }

    func receivedMIDINoteOff(noteNumber: MIDINoteNumber,
        velocity: MIDIVelocity,
        channel: MIDIChannel,
        portID: MIDIUniqueID?,
        offset: MIDITimeStamp) {

        DispatchQueue.main.async {

            //-----------------------------------------
            // Board Logic
            //-----------------------------------------

            // Vars to keep track of the highlighted notes on the grid
            self.smallNote1GridPos = nil
            self.smallNote2GridPos = nil
            self.smallNote3GridPos = nil
            self.smallNote4GridPos = nil
            self.smallNote5GridPos = nil

            // Remove from our pressed key arrays

            self.notesHeld.removeLast()
            self.noteNames.removeLast()

            self.noteNumber = 0
            self.noteOnePressed = false

            self.note1 = nil
            self.note2 = nil
            self.note3 = nil
            self.note4 = nil

            self.noteOnePressed = false
            self.noteTwoPressed = false
            self.noteThreePressed = false
            self.noteFourPressed = false
            self.noteFivePressed = false
            
            //Synth Methods
            self.stopNote(noteNumber: noteNumber)
        }
    }

    //-----------------------------------------
    // Synth Engine Methods
    //-----------------------------------------

    func playNote(noteNumber: UInt8, velocity: UInt8) {
         synth.play(noteNumber: noteNumber, velocity: velocity)
       }

       func stopNote(noteNumber: UInt8) {
         synth.stop(noteNumber: noteNumber)
       }
}

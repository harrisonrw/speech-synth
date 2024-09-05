//
//  ContentView.swift
//  SpeechSynth
//
//  Created by Robert Harrison on 9/5/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var inputText = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Speech Synthesizer")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)

            Spacer()

            Text("Input text")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)

            Spacer()

            TextEditor(text: $inputText)
                .scrollContentBackground(.hidden)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
                .foregroundStyle(.white)
                .tint(Color.blue)

            Spacer()

            VStack(alignment: .center) {
                Button {
                    speak(inputText)
                } label: {
                    Text("Synthesize")
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
                .frame(maxWidth: .infinity)
            }

        }
        .padding()
        .background(Color.black.ignoresSafeArea(.all))
    }

    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

#Preview {
    ContentView()
}

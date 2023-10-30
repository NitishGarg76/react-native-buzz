import Foundation
import AudioToolbox
import UIKit
import CoreHaptics

@available(iOS 13.0, *)
@objc(Buzz)
class Buzz: NSObject {

  private var engine: CHHapticEngine?
  private var isAppInBackground = false

    override init() {
        super.init()
        // Initialize the CoreHaptics engine
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            observeAppState()
        } catch {
            print("Error initializing CoreHaptics engine: \(error.localizedDescription)")
        }
    }

    // Function to observe app state changes
    private func observeAppState() {
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    // Function to handle app entering background
    @objc func appMovedToBackground() {
        isAppInBackground = true
        // Stop the engine or perform necessary actions
        engine?.stop()
    }

    // Function to handle app entering foreground
    @objc func appMovedToForeground() {
        isAppInBackground = false
        // Reinitialize the engine or perform necessary actions
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error reinitializing CoreHaptics engine: \(error.localizedDescription)")
        }
    }

    @objc func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }

  @objc func vibrateLowIntensity(_ intensity: Float) {
    print(intensity,"intensityintensityintensity")
          // Create a haptic event with a custom pattern for the specified intensity
          let event = CHHapticEvent(
              eventType: .hapticTransient,
              parameters: [
                  CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                  CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1) // Adjust sharpness as needed
              ],
              relativeTime: 0
          )
          
          do {
              // Create a haptic pattern from the event
              let pattern = try CHHapticPattern(events: [event], parameters: [])
              
              // Play the haptic pattern
              let player = try engine?.makePlayer(with: pattern)
              try player?.start(atTime: CHHapticTimeImmediate)
          } catch {
              print("Error playing custom haptic pattern: \(error.localizedDescription)")
          }
      }

  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

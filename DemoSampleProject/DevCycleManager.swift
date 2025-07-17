import Foundation
import DevCycle
import SwiftUI

class DevCycleManager: ObservableObject {
    @Published var isFeatureAEnabled: Bool = true // Default value as per your request
    @Published var isFeatureBEnabled: Bool = true
    @Published var isFeatureCEnabled: Bool = true
    @Published var isFeatureDEnabled: Bool = true
    
    private var devcycleClient: DevCycleClient?
    
    func initialize() {
        do {
            // Create an anonymous user. In a real app, you would likely use a stable user ID.
            //let user = try DevCycleUser.builder().isAnonymous(true).build()
            let user = try DevCycleUser
                .builder()
                .customData(["HASHED_SRF_ID":"123453","ACCOUNT_TYPE":"employeeAcct3"])//"HASHED_SRF_ID":"1234567890", "ACCOUNT_TYPE":"employeeAcct",
                .build()
            
            
            // Initialize the DevCycle client
            self.devcycleClient = try DevCycleClient.builder()
                .sdkKey("dvc_mobile_a3e2bd6d_abbc_4dde_8f67_d02d6b52b1c8_4f08fc0") // Using the key from the sample code
                .user(user)
                .options(DevCycleOptions.builder().logLevel(.debug).build())
                .build { [weak self] error in
                    if let error = error {
                        print("Error initializing DevCycle: \(error)")
                        return
                    }
                    print("DevCycle successfully initialized")
                    self?.setupVariableUpdates()
                }
        } catch {
            print("Error initializing DevCycle: \(error)")
        }
    }
    
    private func setupVariableUpdates() {
        guard let client = self.devcycleClient else { return }
        
        // Get the variable objects
        let featureA = client.variable(key: "feature-a", defaultValue: true)
        let featureB = client.variable(key: "feature-b", defaultValue: true)
        let featureC = client.variable(key: "feature-c", defaultValue: true)
        let featureD = client.variable(key: "feature-d", defaultValue: true)
        
        // Set the initial values
        DispatchQueue.main.async {
            self.isFeatureAEnabled = featureA.value
            self.isFeatureBEnabled = featureB.value
            self.isFeatureCEnabled = featureC.value
            self.isFeatureDEnabled = featureD.value
        }
        
        // Register for real-time updates to the feature flags
        featureA.onUpdate { [weak self] updatedValue in
            DispatchQueue.main.async {
                print("Feature 'feature-a' updated to: \(updatedValue)")
                self?.isFeatureAEnabled = updatedValue
            }
        }
        
        featureB.onUpdate { [weak self] updatedValue in
            DispatchQueue.main.async {
                print("Feature 'feature-b' updated to: \(updatedValue)")
                self?.isFeatureBEnabled = updatedValue
            }
        }
        
        featureC.onUpdate { [weak self] updatedValue in
            DispatchQueue.main.async {
                print("Feature 'feature-c' updated to: \(updatedValue)")
                self?.isFeatureCEnabled = updatedValue
            }
        }
        
        featureD.onUpdate { [weak self] updatedValue in
            DispatchQueue.main.async {
                print("Feature 'feature-d' updated to: \(updatedValue)")
                self?.isFeatureDEnabled = updatedValue
            }
        }
    }
}

//
//  ScanHost.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanHost: View {
    @State private var isScanning = false
    @Binding var result: String
    
    var body: some View {
        VStack {
            if (isScanning) {
                HStack {
                    Button("Cancel", role: .cancel) {
                        isScanning = false
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                ScanView(qrCodeScannedDelegate: { scanResult in
                    result = scanResult
                })
                Spacer()
            } else {
                Spacer()
                if (!result.isEmpty) {
                    Text(result)
                }
                Spacer()
                ScanButton(scanCallback: {
                    isScanning = !isScanning
                })
            }
        }
    }
}

#Preview {
    ScanHost(result: .constant("SampleResult"))
}

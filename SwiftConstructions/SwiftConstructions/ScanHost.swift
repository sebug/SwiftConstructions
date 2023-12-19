//
//  ScanHost.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanHost: View {
    @State private var isScanning = false
    @State var result: String = ""
    @State var resultCaptured: Bool = false
    
    var body: some View {
        VStack {
            if (isScanning && !resultCaptured) {
                HStack {
                    Button("Cancel", role: .cancel) {
                        isScanning = false
                    }
                    Spacer()
                }
                .padding()
                Text(result)
                Spacer()
                ScanView(result:$result,
                resultCaptured: $resultCaptured)
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

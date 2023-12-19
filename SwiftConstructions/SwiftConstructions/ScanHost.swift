//
//  ScanHost.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanHost: View {
    @State private var isScanning = false
    
    var body: some View {
        VStack {
            if (isScanning) {
                ScanView()
            } else {
                Spacer()
                ScanButton()
            }
        }
    }
}

#Preview {
    ScanHost()
}

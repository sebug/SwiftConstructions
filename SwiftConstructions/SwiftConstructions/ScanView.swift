//
//  ScanView.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanView: View {
    var qrCodeScannedDelegate: (String) -> Void
    
    var body: some View {
        QRScanner(qrCodeScannedDelegate: qrCodeScannedDelegate)
    }
}

#Preview {
    ScanView(qrCodeScannedDelegate: {_ in
    })
}

//
//  ScanView.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanView: View {
    @Binding var result: String
    @Binding var resultCaptured: Bool
    
    var body: some View {
        QRScanner(result: $result,
        resultCaptured: $resultCaptured)
    }
}

#Preview {
    ScanView(result: .constant(""),
             resultCaptured: .constant(false))
}

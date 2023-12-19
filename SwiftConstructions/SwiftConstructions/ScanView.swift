//
//  ScanView.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanView: View {
    @Binding var result: String
    
    var body: some View {
        QRScanner(result: $result)
    }
}

#Preview {
    ScanView(result: .constant(""))
}

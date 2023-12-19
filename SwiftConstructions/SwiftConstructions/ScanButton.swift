//
//  ScanButton.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ScanButton: View {
    public var scanCallback: () -> ()
    
    var body: some View {
        Button {
            scanCallback()
        } label: {
            Text("Scan")
        }
    }
}

#Preview {
    ScanButton(scanCallback: {
        
    })
}

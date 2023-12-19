//
//  ContentView.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScanHost(result: .constant(""),
                 resultCaptured: .constant(false))
    }
}

#Preview {
    ContentView()
}

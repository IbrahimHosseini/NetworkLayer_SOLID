//
//  ContentView.swift
//  NetworkLayerSample
//
//  Created by Ibrahim on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.weather.isEmpty ? viewModel.error : "Tehran has a " + viewModel.weather)")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SliderView.swift
//  Bullseye
//
//  Created by Tal talspektor on 16/05/2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double

    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
                .accentColor(Color.orange)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

//struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderView(sliderValue: .constant(false))
//    }
//}

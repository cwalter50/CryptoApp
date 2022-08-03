//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Christopher Walter on 5/16/22.
//

import SwiftUI

struct XMarkButton: View {
    
    // This was deprecated in iOS 15.  I no longer use this view... I use dismiss instead...
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss() // depreciated in iOS 15
            
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}

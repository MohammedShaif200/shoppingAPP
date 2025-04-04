//
//  CountryPickerUI.swift
//  OnlineShoping
//
//  Created by moh on 19/11/2024.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {

    @Binding var contry: Country?

    class Coordinator:NSObject,CountryPickerDelegate{
        var parent:CountryPickerUI
        init(_ parent: CountryPickerUI) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.contry = country
        }
        
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "IN"
        countryPicker.delegate = context.coordinator
         return countryPicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
         
    }
    
    func makeCoordinator() -> Coordinator {
       Coordinator(self)
    }
    
}



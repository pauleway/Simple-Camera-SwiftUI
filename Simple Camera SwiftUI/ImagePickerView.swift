//
//  ImagePickerView.swift
//  Simple Camera SwiftUI
//
//  Created by Paul Way on 3/10/23.
//

// Credit to Medium article by Jeeva Tamilselvan
// https://medium.com/swlh/how-to-open-the-camera-and-photo-library-in-swiftui-9693f9d4586b

// See also https://www.hackingwithswift.com/books/ios-swiftui/integrating-core-image-with-swiftui

import Foundation
import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        
        imagePicker.delegate = context.coordinator // confirming the delegate

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }
    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}



class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

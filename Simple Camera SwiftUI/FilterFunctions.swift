//
//  FilterFunctions.swift
//  Simple Camera SwiftUI
//
//  Created by Paul Way on 3/15/23.
//

import Foundation

import UIKit

func sepiaFilter(_ input: CIImage, intensity: Double) -> CIImage?
{
    let sepiaFilter = CIFilter(name:"CISepiaTone")
    sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
    sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
    return sepiaFilter?.outputImage
}

func bloomFilter(_ input:CIImage, intensity: Double, radius: Double) -> CIImage?
{
    let bloomFilter = CIFilter(name:"CIBloom")
    bloomFilter?.setValue(input, forKey: kCIInputImageKey)
    bloomFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
    bloomFilter?.setValue(radius, forKey: kCIInputRadiusKey)
    return bloomFilter?.outputImage
}


func blurFilter(_ input: CIImage) -> CIImage?
{
    let filter = CIFilter(name:"CIPhotoEffectInstant")
    filter?.setValue(input, forKey: kCIInputImageKey)
    return filter?.outputImage
}

//
//  IUKImageProperties.swift
//  ImageUtilsKit
//
//  Created by Sorin George Budescu on 27/02/18.
//  Copyright © 2018 Sorin George Budescu. All rights reserved.
//

import Foundation


public struct IUKImageProperties
{
    public let sizePx: CGSize
    public let sizeDPI: CGSize
    public let depth: CGFloat
    public let orientation: CGImagePropertyOrientation?
    public let isFloat: Bool
    public let isIndexed: Bool
    public let hasAlpha: Bool
    public let colorModel: String
    public let profileName: String?
    
    public let tiff: [IUKImageProperty]
}

public extension IUKImageProperties
{
    /// - return the properties from the image
    public static func from(source: CGImageSource) -> IUKImageProperties?
    {
        if let propertiesDic = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? NSDictionary
        {
            for entry in propertiesDic
            {
                print("Key: (\(String(describing: type(of: entry.key)))): \(entry.key) -@- Value: (\(String(describing: type(of: entry.value)))): \(entry.value)")
            }
            
            let width = propertiesDic[kCGImagePropertyWidth]
            let height = propertiesDic[kCGImagePropertyWidth]
        }
        
        return nil
    }
}

//
//  CGImageMetadataTagExtensions.swift
//  ImageUtilsKit
//
//  Created by Sorin George Budescu on 26/02/18.
//  Copyright © 2018 Sorin George Budescu. All rights reserved.
//

import Foundation


public extension CGImageMetadataTag
{
    ///Convenience property to get the name of the tag
    public var name: String?
    {
        return CGImageMetadataTagCopyName(self) as String?
    }
    
    ///Convenience property to get the value of the tag
    public var value: CFTypeRef?
    {
        return CGImageMetadataTagCopyValue(self)
    }
    
    ///Convenience property to get the description of the value of the tag
    public var valueDescription: String?
    {
        if let value = self.value
        {
            return CFCopyDescription(value) as String?
        }
        return nil
    }
    
    ///Convenience property to get the prefix of the tag
    public var prefix: String?
    {
        return CGImageMetadataTagCopyPrefix(self) as String?
    }
    
    ///Convenience property to get the namespace of the tag
    public var namespace: String?
    {
        return CGImageMetadataTagCopyNamespace(self) as String?
    }
    ///Convenience property to get the qualifiers of the tag
    public var qualifiers: Array<Any>?
    {
        return CGImageMetadataTagCopyQualifiers(self) as Array?
    }
}

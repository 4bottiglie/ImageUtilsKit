//
//  ImageMetadata.swift
//  ImageUtilsKit
//
//  Created by Sorin George Budescu on 26/02/18.
//  Copyright © 2018 Sorin George Budescu. All rights reserved.
//

import Foundation
import Cocoa

public struct IUKImageMetadata
{
    private let cgMetadata: CGImageMetadata
    public let source: CGImageSource
    
    public let items: [IUKImageMetadataItem]
    
    
    public init?(source: CGImageSource)
    {
        guard let cgMetadata = CGImageSourceCopyMetadataAtIndex(source, 0, nil)
            else{
                return nil
        }
        
        self.source = source
        self.cgMetadata = cgMetadata
        
        let tags = CGImageMetadataCopyTags(cgMetadata) as! [CGImageMetadataTag]
        
        var metadataItems = [IUKImageMetadataItem]()
        for tag in tags
        {
            metadataItems.append(tag.iukMetadataItem)
        }
        
        self.items = metadataItems
    }
    

}


public extension CGImageSource
{
    public var iukMetadata: IUKImageMetadata?
    {
        return IUKImageMetadata(source: self)
    }
}

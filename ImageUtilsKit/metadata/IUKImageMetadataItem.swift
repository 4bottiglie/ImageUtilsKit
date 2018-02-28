//
//  IUKImageMetadataItem.swift
//  ImageUtilsKit
//
//  Created by Sorin George Budescu on 26/02/18.
//  Copyright © 2018 Sorin George Budescu. All rights reserved.
//

import Foundation


public struct IUKImageMetadataItem: CustomStringConvertible
{
    public let name: String
    
    public let prefix: String?
    public let namespace: String?
    public let qualifiers: Array<Any>?
    
    ///The metadata item can have a value or one/multiple childs, ever both
    public let value: String?
    public let childs: [IUKImageMetadataItem]?
    
    /// Init a metadata item with a string value
    public init(name: String, value: String?,  prefix: String?, namespace: String?, qualifiers: Array<Any>?)
    {
        self.name = name
        self.value = value
        self.childs = nil
        self.prefix = prefix
        self.namespace = namespace
        self.qualifiers = qualifiers
    }
    
    /// Init a metadata item with one/multiple childs
    public init(name: String, childs: [IUKImageMetadataItem],  prefix: String?, namespace: String?, qualifiers: Array<Any>?)
    {
        self.name = name
        self.value = nil
        self.childs = childs
        self.prefix = prefix
        self.namespace = namespace
        self.qualifiers = qualifiers
    }
    
    public var description: String
    {
        let valueStr = childs != nil ? childs!.description : (value?.description ?? "nill")
            
        var desc = "Item\nname: \(name)\nvalue: \(valueStr)"
        
        if let prefix = prefix
        {
            desc += "\nprefix: \(prefix)"
        }
        if let namespace = namespace
        {
            desc += "\nnamespace: \(namespace)"
        }
        if let qualifiers = qualifiers
        {
            desc += "\nqualifiers: \(qualifiers)"
        }
        return desc
    }
    
    
}

public protocol IUKImageMetadataItemValue
{
    
}

public extension CGImageMetadataTag
{
    public var iukMetadataItem: IUKImageMetadataItem
    {
        let itemValue = self.value
        
        let value: String?
        var childs: [IUKImageMetadataItem]?
        
        if let stringValue = itemValue as? String
        {
            value = stringValue
            childs = nil
        }else if let array = (itemValue as? Array<AnyObject>)
        {
            value = nil
            childs = [IUKImageMetadataItem]()
            for element in array
            {
                let tag = element as! CGImageMetadataTag
                
                childs?.append(tag.iukMetadataItem)
            }
        }else if let dictionary = (itemValue as? NSDictionary)
        {
            value = nil
            childs = [IUKImageMetadataItem]()
            for element in dictionary
            {
                let tag = element.value as! CGImageMetadataTag
                childs?.append(tag.iukMetadataItem)
            }
            
        }else
        {
            value = CFCopyDescription(itemValue) as String?
            childs = [IUKImageMetadataItem]()
        }
        
        if childs != nil
        {
            return IUKImageMetadataItem(name: self.name!, childs: childs!, prefix: self.prefix, namespace: self.namespace, qualifiers: self.qualifiers)
        }
        
        return IUKImageMetadataItem(name: self.name!, value: value, prefix: self.prefix, namespace: self.namespace, qualifiers: self.qualifiers)
    }
}













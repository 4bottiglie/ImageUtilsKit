//
//  CGImageSourceExtensions.swift
//  ImageUtilsKit
//
//  Created by Sorin George Budescu on 26/02/18.
//  Copyright © 2018 Sorin George Budescu. All rights reserved.
//

import Foundation
import BasicsMacKit4b

public extension CGImageSource
{
    public static func fromURL(url: URL) -> CGImageSource?
    {
        return CGImageSourceCreateWithURL(url.cfURL, nil)
    }
}

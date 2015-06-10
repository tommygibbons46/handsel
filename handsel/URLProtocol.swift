//
//  URLProtocol.swift
//  handsel
//
//  Created by Thomas Gibbons on 6/9/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

var requestCount = 0


class URLProtocol: NSURLProtocol
{
    override class func canInitWithRequest(request: NSURLRequest) -> Bool
    {
        println("Request #\(requestCount++): URL = \(request.URL!.absoluteString)")
        return false
    }
}

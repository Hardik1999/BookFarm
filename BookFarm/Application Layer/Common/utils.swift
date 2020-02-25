//
//  utils.swift
//  Practice
//
//  Created by apple on 11/09/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class utils {
    static func setImageFromUrl(imageView:UIImageView! , urlString:String!) {
        // print("utils kf string : ==== "+urlString)
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        imageView.kf.setImage(
            with: URL(string: url!),
            placeholder: UIImage(named: "add book"),
            options: [] )
        {
            result in
            switch result {
            case .success( _):
                // print("Task done for: \(value.source.url?.absoluteString ?? "")")
                
                break
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
                
                break
            }
        }
    }
}

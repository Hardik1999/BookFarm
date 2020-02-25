//
//  ResponseStructs.swift
//  BookFarm
//
//  Created by Mac on 18/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

//login

struct LoginResponse: Codable {
    let userId: String!
    let userName: String!
    let userPassword: String!
    let userMobile: String!
    let userEmail: String!
    let userProfile: String!
    let userPremiumStatus: String!
    let userRole: String!
    let message: String!
    let status: Int!

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userName = "user_name"
        case userPassword = "user_password"
        case userMobile = "user_mobile"
        case userEmail = "user_email"
        case userProfile = "user_profile"
        case userPremiumStatus = "user_premium_status"
        case userRole = "user_role"
        case message = "message"
        case status = "status"
    }
}

// book category
struct CategoryResponse: Codable {
    let categories: [Category]!
    let status: Int!
    let message: String!

    enum CodingKeys: String, CodingKey {
        case categories = "Categories"
        case status = "status"
        case message = "message"
    }
}

 //MARK: - Category
struct Category: Codable {
    let catID: String!
    let catName: String!
    let catIcon: String!

    enum CodingKeys: String, CodingKey {
        case catID = "cat_id"
        case catName = "cat_name"
        case catIcon = "cat_icon"
    }
}


// MARK: - AllBookResponse
struct BookResponse: Codable {
    let books: [Book]!
    let message, status: String!
}

// MARK: - Book
struct Book: Codable {
    let bookName, authorName, bookEdition, bookLanguage: String!
    let bookCategory, sellPrice, rentPrice, bookDescription: String!
    let bookCategoryID: String!
    let bookImages: [BookImage]!

    enum CodingKeys: String, CodingKey {
        case bookName = "book_name"
        case authorName = "author_name"
        case bookEdition = "book_edition"
        case bookLanguage = "book_language"
        case bookCategory = "book_category"
        case sellPrice = "sell_price"
        case rentPrice = "rent_price"
        case bookDescription = "book_description"
        case bookCategoryID = "book_category_id"
        case bookImages = "book_images"
    }
}

// MARK: - BookImage
struct BookImage: Codable {
    let bookImageURL: String!

    enum CodingKeys: String, CodingKey {
        case bookImageURL = "book_image_url"
    }
}

// update profile

struct UpdateResponse: Codable {
    let message: String!
    let status: Int!

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
}

struct ForgotPasswordResponse: Codable {
    let userID: String!
    let userName: String!
    let userMobile: String!
    let userPassword: String!
    let userEmail: String!
    let message: String!
    let status: Int!

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case userMobile = "user_mobile"
        case userPassword = "user_password"
        case userEmail = "user_email"
        case message = "message"
        case status = "status"
    }
}
struct CommonResponse : Codable {
    let status : String!
    let message : String!
    
    enum CodingKeys : String, CodingKey{
        case message = "message"
        case status = "status"
    }
}


// MARK: - TimelineResponse
struct TimelineResponse: Codable {
    let timeline: [Timeline]!
    let message: String!
    let status: String!

    enum CodingKeys: String, CodingKey {
        case timeline = "timeline"
        case message = "message"
        case status = "status"
    }
}

// MARK: - Timeline
struct Timeline: Codable {
    let userId: String!
    let timelineAbout: String!
    let postTypeFlag: String!
    let userProfilePicture: String!
    let userName: String!
    let userEmail: String!
    let timelineImage: [TimelineImage]!

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case timelineAbout = "timeline_about"
        case postTypeFlag = "post_type_flag"
        case userProfilePicture = "user_profile_picture"
        case userName = "user_name"
        case userEmail = "user_email"
        case timelineImage = "timeline_image"
    }
}

// MARK: - TimelineImage
struct TimelineImage: Codable {
    let timelineImageUrl: String!

    enum CodingKeys: String, CodingKey {
        case timelineImageUrl = "timeline_image_url"
    }
}

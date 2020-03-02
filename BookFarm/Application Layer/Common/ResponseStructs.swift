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




// MARK: - BookResponse
struct BookResponse: Codable {
    let book: [Book]!
    let message: String!
    let status: String!

    enum CodingKeys: String, CodingKey {
        case book = "book"
        case message = "message"
        case status = "status"
    }
}

// MARK: - Book
struct Book: Codable {
    let userId: String!
    let bookId: String!
    let bookName: String!
    let authorName: String!
    let bookIsPrime: String!
    let bookEdition: String!
    let bookCategory: String!
    let rentPrice: String!
    let sellPrice: String!
    let bookLanguage: String!
    let bookDescription: String!
    let bookCategoryId: String!
    let userProfilePicture: String!
    let userName: String!
    let userEmail: String!
    let bookImages: [BookImage]!

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case bookId = "Book_id"
        case bookName = "book_name"
        case authorName = "author_name"
        case bookIsPrime = "book_is_prime"
        case bookEdition = "book_edition"
        case bookCategory = "book_category"
        case rentPrice = "rent_price"
        case sellPrice = "sell_price"
        case bookLanguage = "book_language"
        case bookDescription = "book_description"
        case bookCategoryId = "book_category_id"
        case userProfilePicture = "user_profile_picture"
        case userName = "user_name"
        case userEmail = "user_email"
        case bookImages = "book_images"
    }
}

enum BookCategory: String, Codable {
    case empty = ""
    case encyclopedias = "Encyclopedias"
    case horror = "Horror"
}

// MARK: - BookImage
struct BookImage: Codable {
    let bookImageUrl: String!

    enum CodingKeys: String, CodingKey {
        case bookImageUrl = "book_image_url"
    }
}

enum UserEmail: String, Codable {
    case hardikGmailCom = "hardik@gmail.com"
}

enum UserName: String, Codable {
    case hardik = "Hardik"
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
    let timelineId: String!
    let userProfilePicture: String!
    let userName: String!
    let userEmail: String!
    let timelineImage: [TimelineImage]!

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case timelineAbout = "timeline_about"
        case postTypeFlag = "post_type_flag"
        case timelineId = "timeline_id"
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


// MARK: - EbookResponse
struct EbookResponse: Codable {
    let ebooks: [Ebook]!
    let message: String!
    let status: String!

    enum CodingKeys: String, CodingKey {
        case ebooks = "Ebooks"
        case message = "message"
        case status = "status"
    }
}

// MARK: - Ebook
struct Ebook: Codable {
    let ebookName: String!
    let writerName: String!
    let ebookLanguage: String!
    let ebookCategory: String!
    let ebookDescription: String!
    let ebookCategoryId: String!
    let ebookUrl: String!
    let ebook_image: String!

    enum CodingKeys: String, CodingKey {
        case ebookName = "ebook_name"
        case writerName = "writer_name"
        case ebookLanguage = "ebook_language"
        case ebookCategory = "ebook_category"
        case ebookDescription = "ebook_description"
        case ebookCategoryId = "ebook_category_id"
        case ebookUrl = "ebook_url"
        case ebook_image = "ebook_image"
    }
}

// MARK: - EbookImage

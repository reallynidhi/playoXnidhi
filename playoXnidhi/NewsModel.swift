//
//  NewsModel.swift
//  playoXnidhi
//
//  Created by Nidhi Soni on 01/12/21.


import Foundation

struct APIResponse: Decodable {
    let articles: [Article]
    
}
struct Article: Decodable {
    let author: String?
    let title: String?
    let descrption: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
}

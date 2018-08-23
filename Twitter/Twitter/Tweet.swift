//
//  Tweet.swift
//  Twitter
//
//  Created by Nurlybek Mussin on 11.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//


import Foundation
import FirebaseDatabase

class Tweet{
    private var context: String?
    private var username: String?
    private var tweettime: String?
    private var hashtag: String?
    
    init(_ context: String, _ hashtag: String, _ tweettime: String, _ username: String) {
        self.context = context
        self.username = username
        self.tweettime = tweettime
        self.hashtag = hashtag
    }
    
    init(_ snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        context = tweet.value(forKey: "context") as? String
        username = tweet.value(forKey: "username") as? String
        hashtag = tweet.value(forKey: "hashtag") as? String
        tweettime = tweet.value(forKey: "time") as? String
    }
    var Context: String?{
        get{
            return context
        }
    }
    var Username: String?{
        get{
            return username
        }
    }
    var Hashtag: String? {
        get{
            return hashtag
        }
    }
    var Time: String? {
        get{
            return tweettime
        }
    }
    func toJSONFormat()-> Any{
        return ["context": context,
                "hashtag": hashtag,
                "time": tweettime,
                "username": username]
    }
}


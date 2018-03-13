//
//  SocketService.swift
//  Smack
//
//  Created by Stephen Learmonth on 13/03/2018.
//  Copyright © 2018 Devslopes. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
//    var socket : SocketIOClient = SocketIOClient(manager: URL(string: BASE_URL) as! SocketManagerSpec, nsp: "/Swift" )
    var socket: SocketIOClient = SocketIOClient(manager: URL(string: BASE_URL)! as! SocketManagerSpec, nsp: "")
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()        
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("NewChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelID = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelID)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    
    
    
    
    
}

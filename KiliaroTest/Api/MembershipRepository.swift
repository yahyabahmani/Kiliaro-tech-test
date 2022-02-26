//
//  MemberShip.swift
//  KiliaroTest
//
//  Created by yahya on 2/25/22.
//

import Foundation
class MemberShip {
    
  class func sendVerifyCode(phone:String,verifyCode:String,sucess sucessdeds:@escaping ()->(), failure failed:@escaping (String)->()){
      let url = ApiURL.ist_media_in_shared
      
      HTTPService.request(method: .get, andUrl: url, succeeded: { (hd:ResponseDataAllInformation.responseCodeVerification) in
          let verfiy = CurrentUserRealm(hd)
          RealmService.shared.create(verfiy,update: true) { (error) in
              if error != nil {
                failed(error ?? "")
              }
          }
          sucessdeds()
      }) { (error) in
          failed(error)
      }
  }
  
}

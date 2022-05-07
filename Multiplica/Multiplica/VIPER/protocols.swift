//
//  protocol.swift
//  Multiplica
//
//  Created by Asesoftware on 6/05/22.
//

import Foundation
import UIKit

protocol ViewToPresenterTimerProtocol:AnyObject{
    
    var view: PresenterToViewTimerProtocol? {get set}
    var interactor: PresenterToInteractorTimerProtocol? {get set}
    var router: PresenterToRouterTimerProtocol? {get set}
    func startFetchingTimer(vDataTime:String,vDataTimeM:String)
    
}

protocol PresenterToViewTimerProtocol:AnyObject{
    func dataSuccessTime(pDataTime:String)
    func dataFinishTime()
}

protocol PresenterToRouterTimerProtocol:AnyObject{
    static func createTimerModule() -> ViewController
}

protocol PresenterToInteractorTimerProtocol:AnyObject{
    var presenter:InteractorToPresentTimerProtocol? {get set}
    func fetchTimer(rDataTime:String,rDataTimeM:String)
}

protocol InteractorToPresentTimerProtocol:AnyObject{
    func timerSuccess(iDataTime:String)
    func timerFinish()
}

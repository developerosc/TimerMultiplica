//
//  Presenter.swift
//  Multiplica
//
//  Created by Asesoftware on 6/05/22.
//

import Foundation
import UIKit

class TimePresent:ViewToPresenterTimerProtocol{


    
    var interactor: PresenterToInteractorTimerProtocol?
    
    var router: PresenterToRouterTimerProtocol?
    
    var view: PresenterToViewTimerProtocol?
    
    func startFetchingTimer(vDataTime: String,vDataTimeM: String) {
        interactor?.fetchTimer(rDataTime: vDataTime, rDataTimeM: vDataTimeM)
    }
 
}

extension TimePresent:InteractorToPresentTimerProtocol{
    func timerFinish() {
        view?.dataFinishTime()
    }
    
    func timerSuccess(iDataTime: String) {
        view?.dataSuccessTime(pDataTime: iDataTime)
    }
    
    
}

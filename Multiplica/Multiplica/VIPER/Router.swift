//
//  Router.swift
//  Multiplica
//
//  Created by Asesoftware on 6/05/22.
//

import Foundation
import UIKit


class TimeRouter: PresenterToRouterTimerProtocol{
    
    static func createTimerModule() -> ViewController {
        
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "myViewController") as! ViewController
        
        let presenter: ViewToPresenterTimerProtocol & InteractorToPresentTimerProtocol = TimePresent()
        let interactor: PresenterToInteractorTimerProtocol = TimeInteractor()
        let router: PresenterToRouterTimerProtocol = TimeRouter()
        
        
        view.timePresenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
}

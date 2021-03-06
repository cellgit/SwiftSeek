//
//  ScrollTabelViewController.swift
//  SwiftSeek
//
//  Created by 刘宏立 on 2019/4/20.
//  Copyright © 2019 liuhongli. All rights reserved.
//

import UIKit

class ScrollTabelViewController: UIViewController {
    
    var channelId: String = ""
    var channelIndex: Int = 0
    
    convenience init(channelId: String, index: Int) {
        self.init()
        
        self.channelId = channelId
        self.channelIndex = index
        
        print("channelId==:\(self.channelId)===channelIndex:\(String(describing: self.channelIndex))")
    }
    

    var containerView: SketchHotkeysView!
    var presenter: SketchHotkeysPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Sketch"
        
//        setupNavBar()
        setupUI()
        reqData()
        
    }
    
    func setupNavBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
    }
    func setupUI() {
        self.containerView = SketchHotkeysView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(self.containerView)
        self.presenter = SketchHotkeysPresenter.init(model: HotkeysModel(), containerView: self.containerView)
        
        
    }
}

extension ScrollTabelViewController {
    func reqData() {
        let dict = ["":""]
        let url = APIManager.baseUrl + API.SKETCH
//        print("url === \(url)")
        let params = SWNetworkParamsStruct.init(url: url, dict: dict, method: .post)
        self.presenter.gotoRequestCommunityData(params: params)
        
    }
    
    
    
    
}

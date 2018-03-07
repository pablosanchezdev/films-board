//
//  MediaItemsTabCoordinator.swift
//  FilmsBoard
//
//  Created by Pablo on 07/03/2018.
//  Copyright © 2018 Pablo. All rights reserved.
//

import UIKit

@objc
class MediaItemsTabCoordinator: NSObject {

    private let navigationController: UINavigationController
    private let viewModel: MediaItemsViewModel

    @objc
    init(viewModel: MediaItemsViewModel) {
        self.navigationController = UINavigationController()
        self.viewModel = viewModel
        super.init()
    }
}

extension MediaItemsTabCoordinator: Coordinable {

    /**
     The root view controller for this coordinator
     */
    var rootViewController: UIViewController {
        return navigationController
    }

    /**
     Initial configuration for the coordinator
     */
    func start() {
        self.initNavigationController()
    }
}

extension MediaItemsTabCoordinator {

    private func initNavigationController() {
        let viewController = MediaItemsViewController(viewModel: self.viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

@objc
protocol MediaItemsTabCoordinatorProvider: NSObjectProtocol {
    func mediaItemsTabCoordinator() -> MediaItemsTabCoordinator
}
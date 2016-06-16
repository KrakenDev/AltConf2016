//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let home = HomeViewController()
let navigationController = UINavigationController(rootViewController: home)
XCPlaygroundPage.currentPage.liveView = navigationController.view
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

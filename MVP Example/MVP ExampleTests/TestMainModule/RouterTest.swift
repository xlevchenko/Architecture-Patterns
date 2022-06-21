//
//  RouterTest.swift
//  MVP ExampleTests
//
//  Created by Olexsii Levchenko on 6/21/22.
//

import XCTest
@testable import MVP_Example

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    

    override func setUpWithError() throws {
        let assembly = AssemblyModuleBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRouter() {
        router.showDitail(comment: nil)
        let detailViewController = navigationController.presentedVC
        
        XCTAssertTrue(detailViewController is DetailViewController)
    }

}

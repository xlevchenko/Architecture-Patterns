//
//  MainPresenterTest.swift
//  MVP ExampleTests
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import XCTest
@testable import MVP_Example

class MockView: MainViewProtocol {
    func succes() {
        
    }
    
    func failure(error: Error) {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    
    var comments: [Comment]!
    
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    
}

class MainPresenterTest: XCTestCase {
   
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()
    
    override func setUpWithError() throws {
        let navBar = UINavigationController()
        let assmbly = AssemblyModuleBuilder()
        router = Router(navigationController: navBar, assemblyBuilder: assmbly)
    }
    
    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetSuccesComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networlService: networkService, router: router)
        
        var cathcComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                cathcComments = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(cathcComments?.count, 0)
        XCTAssertEqual(cathcComments?.count, comments.count)
    }
    
    
    func testGetFailureComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networlService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                print(comments!)
            case .failure(let error):
                catchError = error
            }
        }
        
       XCTAssertNotNil(catchError)
    }
}

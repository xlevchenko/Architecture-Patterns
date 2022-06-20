//
//  MainPresenterTest.swift
//  MVP ExampleTests
//
//  Created by Olexsii Levchenko on 6/19/22.
//

import XCTest
@testable import MVP_Example

class MockView: MainViewProtocol {
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
    
    
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Comment!
    var presentor: MainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Comment(firstName: "Baz", lastName: "Bar")
        presentor = MainPresenter(view: view, person: person)
    }
    
    override func tearDownWithError() throws {
        view = nil
        person = nil
        presentor = nil
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
    
    func testModulIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presentor, "presrntor is not nil")
    }
    
    func testView() {
        presentor.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }
}

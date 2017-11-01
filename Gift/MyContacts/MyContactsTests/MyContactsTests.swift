//
//  MyContactsTests.swift
//  MyContactsTests
//
//  Created by Koketso Gift Matlhatsi on 10/31/17.
//  Copyright © 2017 Koketso Gift Matlhatsi. All rights reserved.
//

import XCTest
import ContactEntry
@testable import MyContacts

class MyContactsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func shouldInitialiseContactEntryObject() {
        
        let contactEntry: ContactEntry? = ContactEntry();

        XCTAssert(contactEntry.isKindOfClass(ContactEntry), "should instantiate ContactEntry")

    }   
    
    func shouldHaveFullName() {

        let contactEntry: NSObject?


    }
    
}

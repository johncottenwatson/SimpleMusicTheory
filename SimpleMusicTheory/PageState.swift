//
//  PageState.swift
//  Sono
//
//  Created by John Watson on 12/8/20.
//

import Foundation

class PageState: ObservableObject {
    @Published var pageType: PageType = .launch
    @Published var lesson: Lesson?
    
    init() {
    }
    
    init(lesson: Lesson) {
        self.lesson = lesson
    }
}

public enum PageType {
    case launch
    case main
    case lesson
}

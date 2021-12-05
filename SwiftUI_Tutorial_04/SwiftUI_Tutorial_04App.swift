//
//  SwiftUI_Tutorial_04App.swift
//  SwiftUI_Tutorial_04
//
//  Created by SeongMinK on 2021/12/05.
//

import SwiftUI

@main
struct SwiftUI_Tutorial_04App: App {
    @State private var selectecTab = TabIdentifier.todos
    
    var body: some Scene {
        WindowGroup {
            TabView(
                selection: $selectecTab,
                content: {
                    TodosView().tabItem {
                        VStack {
                            Image(systemName: "list.bullet")
                            Text("할 일 목록")
                        }
                    }.tag(TabIdentifier.todos)
                    ProfileView().tabItem {
                        VStack {
                            Image(systemName: "person.circle.fill")
                            Text("프로필")
                        }
                    }.tag(TabIdentifier.profile)
                }
            )
            .onOpenURL(perform: { url in
                guard let tabId = url.tabIdentifier else { return }
                selectecTab = tabId
            })
        }
    }
}

enum TabIdentifier: Hashable {
    case todos, profile
}

enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    var isDeeplink: Bool {
        return scheme == "deeplink-swiftui"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        // deeplink-swiftui://host
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default: return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        // deeplink-swiftui://host/uuid
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else { return nil }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default: return nil
        }
    }
}

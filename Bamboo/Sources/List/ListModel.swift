//
//  ListModel.swift
//  Bamboo
//
//  Created by Mercen on 2023/02/19.
//

import SwiftUI
import Alamofire

struct List: Codable, Hashable {
    let list: [Post]
}

// MARK: - 리스트 모델
@MainActor class ListModel: ObservableObject {
    
    @Published var list = [Post]()
    @Published var page = 1
    @Published var pageEnded = false
    
    // MARK: - 데이터 로드
    func loadData() {
        if !pageEnded {
            Requests.get("\(postAPI)/list",
                         params: ["page": page], List.self)
            { data in
                
                // MARK: - 페이징 끝난지 확인
                if data.list.isEmpty {
                    self.pageEnded = true
                }
                
                // MARK: - 리스트에 데이터 추가
                else {
                    self.page += 1
                    DispatchQueue.main.async {
                        withAnimation(.default) {
                            self.list += data.list
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - 데이터 새로고침
    func refreshData() {
        self.page = 1
        withAnimation(.default) {
            self.list = [Post]()
        }
        self.pageEnded = false
        
        // MARK: - 데이터 다시 로드
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loadData()
        }
    }
}

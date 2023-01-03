//
//  ViewModel.swift
//  MVVMUIKitExample
//
//  Created by キロ on 2023/01/03.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    let currentLanguage = BehaviorRelay<Int>(value: 0)
    var currentDescription: Observable<String> {
        return currentLanguage.map { currentLanguage in
                if currentLanguage == 0 {
                    return "我是中文。"
                } else {
                    return "日本語ですよ！"
                }
            }
    }
    
    var currentButtonTitle: Observable<String> {
        return currentLanguage.map { currentLanguage in
            if currentLanguage == 0 {
                return "切换成日语"
            } else {
                return "中国語へ"
            }
        }
    }
    
    
    func changeCurrentLanguage() {
        if currentLanguage.value == 0 {
            currentLanguage.accept(1)
        } else {
            currentLanguage.accept(0)
        }
    }
}

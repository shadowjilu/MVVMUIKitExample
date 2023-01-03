//
//  ViewController.swift
//  MVVMUIKitExample
//
//  Created by キロ on 2023/01/03.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var currentDescriptionText: UILabel!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var changeTabButton: UIButton!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.currentLanguage
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
        
        languageControl.rx
            .value
            .bind(to: viewModel.currentLanguage)
            .disposed(by: disposeBag)
        
        viewModel.currentLanguage
            .bind(to: languageControl.rx.value)
            .disposed(by: disposeBag)
        
        viewModel.currentDescription
            .bind(to: currentDescriptionText.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.currentButtonTitle
            .bind(to: changeTabButton.rx.title(for: .normal))
            .disposed(by: disposeBag)
    }


    @IBAction func buttonDidPressed(_ sender: Any) {
        viewModel.changeCurrentLanguage()
    }
}


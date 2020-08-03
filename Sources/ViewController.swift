//
//  ViewController.swift
//  TranslateText-gRPC-iOS
//
//  Created by PRICKETT, JACOB on 7/31/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
  
  private lazy var translateButton: UIButton = {
    var button = UIButton()
    button.setTitle("Translate", for: .normal)
    button.setImage(UIImage(systemName: "mic"), for: .normal)
    button.backgroundColor = .systemGreen
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(translate), for: .touchUpInside)
    return button
  }()
  
  private lazy var textView: UITextView = {
    var textView = UITextView()
    textView.isSelectable = false
    textView.textAlignment = .left
    textView.font = .systemFont(ofSize: 30)
    return textView
  }()
  
  let translationService: TranslationService
  
  init(translationService: TranslationService) {
    self.translationService = translationService
    super.init(nibName: nil, bundle: nil)
  }
  
  convenience init() {
    self.init(translationService: TranslationService())
  }
  
  required init?(coder: NSCoder) { nil }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "gRPC Translation"
    self.view.backgroundColor = .systemBackground
    self.layout()
  }
  
  func layout() {
    self.view.addSubview(textView)
    self.view.addSubview(translateButton)
    
    self.textView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
      make.left.right.equalToSuperview()
      make.bottom.equalTo(translateButton.snp.top)
    }
    
    self.translateButton.snp.makeConstraints { make in
      make.height.equalTo(50)
      make.left.right.equalToSuperview().inset(40)
      make.bottom.equalToSuperview().inset(100)
      make.centerX.equalToSuperview()
    }
  }
  
  @objc
  func translate() {
    self.translationService.detectLanguage()
  }
}


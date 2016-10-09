//
//  ViewController.swift
//  DocumentInteraction
//
//  Created by Maxim on 3/28/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {

	// MARK: - Outlets
	
	@IBOutlet weak var openButton: UIButton!
	
	// MARK: - Document Interaction Controller
	
	fileprivate var documentInteractionController = UIDocumentInteractionController()
	
	// MARK: - UIViewController methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		documentInteractionController.delegate = self
	}

	// MARK: - Actions
	
	@IBAction func openButtonAction(_ sender: UIButton) {
		let epubURL = Bundle.main.url(forResource: "test", withExtension: "epub")
		documentInteractionController.url = epubURL
		
		if !documentInteractionController.presentOpenInMenu(from: openButton.bounds, in: view, animated: true) {
			print("You don't have an app installed that can handle ePub files.")
		}
	}
	
	// MARK: - UIDocumentInteractionControllerDelegate
	
	func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
		return self
	}

}


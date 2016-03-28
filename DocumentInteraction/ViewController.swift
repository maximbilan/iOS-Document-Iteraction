//
//  ViewController.swift
//  DocumentInteraction
//
//  Created by Maxim on 3/28/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {

	@IBOutlet weak var openButton: UIButton!
	
	private var documentInteractionController = UIDocumentInteractionController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		documentInteractionController.delegate = self
	}

	// MARK: - Actions
	
	@IBAction func openButtonAction(sender: UIButton) {
		let epubURL = NSBundle.mainBundle().URLForResource("test", withExtension: "epub")
		documentInteractionController.URL = epubURL
		
		if documentInteractionController.presentOpenInMenuFromRect(openButton.bounds, inView: view, animated: true) {
			print("You don't have an app installed that can handle ePub files.")
		}
	}
	
	// MARK: - UIDocumentInteractionControllerDelegate
	
	func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
		return self
	}

}


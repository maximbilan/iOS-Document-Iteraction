//
//  ViewController.swift
//  DocumentInteraction
//
//  Created by Maxim on 3/28/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
		if let epubURL = Bundle.main.url(forResource: "test", withExtension: "epub") {
			
			// In iOS 11 `copy to iBooks` is not working if the file is in bundle, so this code for copying from the app bundle to Documents
			let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
			let destinationPath = documentDirectoryPath.appendingPathComponent("test.epub")
			let destinationURL = URL(fileURLWithPath: destinationPath)
			do {
				try FileManager.default.copyItem(at: epubURL, to: destinationURL)
			}
			catch {}
			
			documentInteractionController.url = destinationURL
			if !documentInteractionController.presentOpenInMenu(from: openButton.bounds, in: view, animated: true) {
				print("You don't have an app installed that can handle ePub files.")
			}
		}
	}

}

extension ViewController: UIDocumentInteractionControllerDelegate {
	
	func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
		return self
	}
	
}


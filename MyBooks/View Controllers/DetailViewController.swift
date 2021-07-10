//
//  DetailViewController.swift
//  MyBooks
//
//  Created by Christelle Nieves on 7/9/21.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let book: Book
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!

    @IBAction func updatePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera)
            ? .camera
            : .photoLibrary
        
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This should never be called")
    }
    
    init?(coder: NSCoder, book: Book) {
        self.book = book
        super.init(coder: coder)
    }
    
    func setContents() {
        titleLabel.text = book.title
        authorLabel.text = book.author
        imageView.image = book.image
    }
}

extension DetailViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        
        imageView.image = selectedImage
        
        Library.saveImage(selectedImage, forBook: book)
        dismiss(animated: true, completion: nil)
    }
}

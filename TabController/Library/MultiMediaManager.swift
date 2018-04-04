//
//  MultiMediaManager.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Photos
//import RSKImageCropper

@objc protocol MultiMediaManagerDelegate {
    @objc optional func cropSize() -> CGSize
    // @objc optional func cropMode() -> UInt
    @objc optional func didFinishPickingWithImage(image: UIImage)
    func didFinishPickingWithError(error: String)
    @objc optional func didFinishPickingVideo(url: URL)
}

@objc protocol MultimediaPresenterProtocol {
    func presenting() -> UIViewController
}

class MultiMediaManager: NSObject {
    //    fileprivate let videoEncoder = VideoEncoder.init()
    private let imagePicker = UIImagePickerController()
    private weak var presenter: MultimediaPresenterProtocol?
    weak var delegate: MultiMediaManagerDelegate?
    //    private var imageCropper: RSKImageCropViewController?
    
    init(presenter: MultimediaPresenterProtocol) {
        self.presenter = presenter
        super.init()
        imagePicker.delegate  = self
        imagePicker.allowsEditing = true
    }
    
    func openPicker(mode: UIImagePickerControllerCameraCaptureMode) {
        var presentationStyle: UIAlertControllerStyle = .actionSheet
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            presentationStyle = .alert
        }
        //
        let alertController = UIAlertController(title: nil, message: "text_image_upload".localized(), preferredStyle: presentationStyle)
        let cameraAction = UIAlertAction(title: "text_camera".localized(), style: UIAlertActionStyle.default) { (action) in
            self.openCamera(mode: .photo)
        }
        
        
        let galleryAction = UIAlertAction(title: "text_gallery".localized(), style: UIAlertActionStyle.default) { (action) in
            self.showPhotoGallery(mode: mode)
        }
        let cancelAction = UIAlertAction(title: "text_cancel".localized(), style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(galleryAction)
        alertController.addAction(cancelAction)
        self.presentViewController(viewController: alertController, animated: true, completion: nil)
    }
    
    private func presentViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        OperationQueue.main.addOperation {
            self.presenter?.presenting().present(viewController, animated: animated, completion: completion)
        }
    }
    
    func openCamera(mode: UIImagePickerControllerCameraCaptureMode) {
        logger("opening a camera...")
        
        func openPicker() {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            let mediaTypes =  ["public.image"]
            self.imagePicker.mediaTypes = mediaTypes
            self.imagePicker.cameraCaptureMode = mode
            self.imagePicker.allowsEditing = false
            self.presentViewController(viewController: self.imagePicker, animated: true, completion: nil)
        }
        
        PermissionHelper.isAllowedToRecordVideo { (isAllowed) in
            if isAllowed {
                openPicker()
            }else {
                self.presenter?.presenting().alert(message: "error_camera_permission".localized(), okAction: {
                    let url = URL(string: UIApplicationOpenSettingsURLString)!
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                })
            }
        }
    }
    
    private func showPhotoGallery(mode: UIImagePickerControllerCameraCaptureMode) {
        PermissionHelper.isAllowedToShowGallary { (isAllowed) in
            if isAllowed {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                let mediaTypes = mode == .video ? ["public.image", "public.movie"] : ["public.image"]
                self.imagePicker.mediaTypes = mediaTypes
                self.presentViewController(viewController: self.imagePicker, animated: true, completion: nil)
            }else {
                self.presenter?.presenting().alert(message: "error_gallery_permission".localized(), okAction: {
                    let url = URL(string: UIApplicationOpenSettingsURLString)!
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                })
            }
        }
        
    }
    
    
    func resizeImage(image: UIImage, to targetSize: CGSize) -> UIImage? {
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: CGPoint.zero, size: targetSize)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension MultiMediaManager: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var completion: (()->())?
        
        if let mediaType = info["UIImagePickerControllerMediaType"] as? String {
            if mediaType == "public.image" {
                if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
                    if let cropsize = self.delegate?.cropSize?() {
                        if picture.size.width < cropsize.width || picture.size.height < cropsize.height {
                            self.delegate?.didFinishPickingWithError(error: "Image size must be greater than \(cropsize.width) X \(cropsize.height)")
                        }else {
                            guard let resizedImage = self.resizeImage(image: picture, to: cropsize) else { return }
                            completion = {
                                self.delegate?.didFinishPickingWithImage?(image: resizedImage)
                            }
                            
                            // self.cropImage(image: picture)
                        }
                    }else {
                        completion = {
                            self.delegate?.didFinishPickingWithImage?(image: picture)
                        }
                    }
                }
            }else if mediaType == "public.movie" {
                _ = info["UIImagePickerControllerMediaURL"] as! URL
                return
            }
        }
        picker.dismiss(animated: true) {
            completion?()
        }
    }
}

extension MultiMediaManager: UINavigationControllerDelegate {
    
}

struct PermissionHelper {
    static func isAllowedToRecordVideo(completion: @escaping (Bool) -> ()) {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        completion(status != .denied && status != .restricted)
    }
    
    static func isAllowedToRecordSound(completion: @escaping (Bool) -> ()) {
        AVAudioSession.sharedInstance().requestRecordPermission(completion)
    }
    
    static func isAllowedToShowGallary(completion: @escaping (Bool) -> ()) {
        PHPhotoLibrary.requestAuthorization { (status) in
            completion(status == .authorized)
        }
    }
    
}


//
//  QRCodeScannerViewController.swift
//  TsukasaDelivery
//
//  Created by Dari on 10/24/17.
//  Copyright © 2017 Lizan Pradhanang. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeScannerViewController: UIViewController {
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    

    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    var onObtained: ((QRCodeScannerViewController, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         checkPermission()
    }
    
    @IBAction func close(_ sender: Any?) {
        self.captureSession?.stopRunning()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func checkPermission() {
        PermissionHelper.isAllowedToRecordVideo { (isAllowed) in
            if isAllowed {
                self.openQr()
            }else {
                self.alertWithOkCancel(message: "error_camera_permission".localized(), okAction: {
                    let url = URL(string: UIApplicationOpenSettingsURLString)!
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }, cancelAction: {
                    self.close(nil)
                })
            }
        }
    }
    
    private func openQr() {
        if self.setupAvCapture() {
            setupOutput()
            setupVideoLayer()
            // Start video capture.
            captureSession?.startRunning()
            setupQRCodeFrameView()
            self.view.bringSubview(toFront: messageLabel)
            self.view.bringSubview(toFront: closeButton)
        }
    }

    func setupAvCapture() -> Bool {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            guard let captureDevice = captureDevice else {return false}
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            return true
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return false
        }
    }
    
    func setupOutput() {
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
    }
    
    func setupVideoLayer() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
    }
    
    func setupQRCodeFrameView() {
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        qrCodeFrameView!.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView!.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubview(toFront: qrCodeFrameView!)
    }
    
}

extension QRCodeScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "noQR".localized()
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let qrCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = qrCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                self.captureSession?.stopRunning()
                self.dismiss(animated: true, completion: nil)
                self.onObtained?(self, metadataObj.stringValue!)
            }
        }
    }
}

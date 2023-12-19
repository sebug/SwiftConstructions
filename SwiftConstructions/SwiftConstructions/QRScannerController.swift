//
//  QRScannerController.swift
//  SwiftConstructions
//
//  Created by Sebastian Gfeller on 19.12.2023.
//

import Foundation
import SwiftUI
import AVFoundation

class QRScannerController : UIViewController {
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    var delegate: AVCaptureMetadataOutputObjectsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                          for: .video,
                                                          position: .back) else {
            print("Failed to get camera device")
            return
        }
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            print(error)
            return
        }
        
        captureSession.addInput(videoInput)
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [ .qr ]
        
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }
}

struct QRScanner: UIViewControllerRepresentable {
    @Binding var result: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = QRScannerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($result)
    }
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        @Binding var scanResult: String
        
       init(_ scanResult: Binding<String>) {
           self._scanResult = scanResult
       }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if (metadataObjects.count == 0) {
                scanResult = "No QR Code detected"
                return
            }
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            if metadataObj.type == AVMetadataObject.ObjectType.qr, let result = metadataObj.stringValue {
                scanResult = result
            }
        }
    }
}

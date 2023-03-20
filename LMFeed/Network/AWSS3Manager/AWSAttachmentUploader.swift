//
//  AWSAttachmentUploader.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 22/02/23.
//

import Foundation
import AVFoundation
import AWSCognito
import AWSS3


enum UploaderType{
    case image
    case video
    case audio
    case file
}


class AWSAttachmentUploader {
    
    static let sharedInstance = AWSAttachmentUploader()
    
    func awsUploader(uploaderType: UploaderType, awsFilePath: String, image: Data?, localFilePath: String, content: String = "", thumbNailUrl:String? = nil,index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        
        if uploaderType == .video {
            awsUploadVideo(filePath: awsFilePath, videoPath: localFilePath, thumbNail: thumbNailUrl ?? "", progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error, index) in
                
                completion?(uploadedFileUrl, thumbNailUrl, error,index )
//                if let finalPath = uploadedFileUrl as? String {
//                    guard let completionBlock = completion else { return }
//                    completionBlock(finalPath, thumbNailUrl, nil, nil)
//                } else {
//                    //print("\(String(describing: error?.localizedDescription))")
//                }
                
            }
            
        } else if uploaderType == .audio {
            awsUploadAudio(filePath: awsFilePath, audioPath: localFilePath, progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error,index)  in
                
                completion?(uploadedFileUrl, thumbNailUrl, error,index )
//                if let finalPath = uploadedFileUrl as? String {
//                    guard let completionBlock = completion else { return }
//                    completionBlock(finalPath, nil, nil ,nil)
//                } else {
//                    //print("\(String(describing: error?.localizedDescription))")
//                }
                
            }
            
        }else if uploaderType == .file {
            
            awsUploadFile(filePath: awsFilePath, fileUrlString: localFilePath, content: content ,progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error,index) in
                completion?(uploadedFileUrl, thumbNailUrl, error,index )
//                if let finalPath = uploadedFileUrl as? String {
//                    guard let completionBlock = completion else { return }
//                    completionBlock(finalPath, nil, nil,nil)
//                } else {
//                    //print("\(String(describing: error?.localizedDescription))")
//                }
                
            }
            
        }else if uploaderType == .image {
            guard let image = image else {
                completion?(nil, nil , nil, index)
                return
            }
            awsUploadImage(filePath: awsFilePath, imageData: image, index: index, progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl,thumbNailUrl, error,index) in
                completion?(uploadedFileUrl, thumbNailUrl, error,index )
//                if let finalPath = uploadedFileUrl as? String {
//                    guard let completionBlock = completion else { return }
//                    completionBlock(finalPath, nil , nil, index)
//                } else {
//                    //print("\(String(describing: error?.localizedDescription))")
//                }
                
            }
        }
        
    }
    
    func awsUploadGifImage(filePath: String, fileURL: URL, index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        AWSS3Manager.shared.uploadOtherFile(filePath: filePath, fileUrl: fileURL, conentType: "gif", progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error,index ) in
            
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, nil, nil, index)
//            } else {
//                //print("\(String(describing: error?.localizedDescription))")
//            }
        }
    }
}

extension AWSAttachmentUploader {
    private func awsUploadImage(filePath: String = "", imageData: Data?, index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        AWSS3Manager.shared.uploadImage(filePath: filePath, imageData: imageData, index: index, progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error,index ) in
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, nil, nil, index)
//            } else {
//                //print("\(String(describing: error?.localizedDescription))")
//            }
            
        }
    }
    
    private func awsUploadVideo(filePath: String = "", videoPath: String, thumbNail: String, progress: ProgressBlock?, completion: CompletionBlock?) {
        let videoUrl = URL(fileURLWithPath: videoPath)
        AWSS3Manager.shared.uploadVideo(filePath: filePath, videoUrl: videoUrl, thumbNail: thumbNail, progress: { (progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error, index)  in
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, thumbNailUrl, nil,nil)
//            } else {
//                //print("\(String(describing: error?.localizedDescription))")
//            }
            
        }
    }
    
    private func awsUploadAudio(filePath: String = "", audioPath: String, progress: ProgressBlock?, completion: CompletionBlock?) {
        let audioUrl = URL(fileURLWithPath: audioPath)
        AWSS3Manager.shared.uploadAudio(filePath: filePath, audioUrl: audioUrl, progress: { (progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error, index)  in
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, nil, nil,nil)
//            } else {
//                //print("\(String(describing: error?.localizedDescription))")
//            }
            
        }
        
    }
    
    private func awsUploadFile(filePath: String = "", fileUrlString: String, content: String, progress: ProgressBlock?, completion: CompletionBlock?) {
        let fileURL = URL(fileURLWithPath: fileUrlString)
        AWSS3Manager.shared.uploadOtherFile(filePath: filePath, fileUrl: fileURL, conentType: content,  progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error, index) in
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, nil, nil, nil)
//            } else {
//                //print("\(String(describing: error?.localizedDescription))")
//            }
            
        }
    }
    
    func awsUploadFromFileUrl(filePath: String = "", fileUrlString: String, content: String, progress: ProgressBlock?, completion: CompletionBlock?) {
        let fileURL = URL(fileURLWithPath: fileUrlString)
        AWSS3Manager.shared.uploadOtherFile(filePath: filePath, fileUrl: fileURL, conentType: content,  progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error, index) in
            completion?(uploadedFileUrl, thumbNailUrl, error,index )
//            if let finalPath = uploadedFileUrl as? String {
//                guard let completionBlock = completion else { return }
//                completionBlock(finalPath, nil, nil, nil)
//            } else {
//                print("\(String(describing: error?.localizedDescription))")
//            }
            
        }
    }
}

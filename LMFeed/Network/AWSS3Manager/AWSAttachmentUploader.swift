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


enum uploaderType{
    case image
    case video
    case audio
    case file
}


class UploadManager {
    
    static let sharedInstance = UploadManager()
    
    func awsUploader(uploaderType: uploaderType, filePath: String = "", image: Data, path: String = "", content: String = "", thumbNailUrl:String? = nil,index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        
        if uploaderType == .video {
            awsUploadVideo(filePath: filePath, videoPath: path, thumbNail: thumbNailUrl ?? "", progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error, index) in
                
                if let finalPath = uploadedFileUrl as? String {
                    guard let completionBlock = completion else { return }
                    completionBlock(finalPath, thumbNailUrl, nil, nil)
                } else {
                    //print("\(String(describing: error?.localizedDescription))")
                }
                
            }
            
        } else if uploaderType == .audio {
            awsUploadAudio(filePath: filePath, audioPath: path, progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error,index)  in
                
                if let finalPath = uploadedFileUrl as? String {
                    guard let completionBlock = completion else { return }
                    completionBlock(finalPath, nil, nil ,nil)
                } else {
                    //print("\(String(describing: error?.localizedDescription))")
                }
                
            }
            
        }else if uploaderType == .file {
            
            awsUploadFile(filePath: filePath, fileUrlString: path, content: content ,progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl, thumbNailUrl, error,index) in
                
                if let finalPath = uploadedFileUrl as? String {
                    guard let completionBlock = completion else { return }
                    completionBlock(finalPath, nil, nil,nil)
                } else {
                    //print("\(String(describing: error?.localizedDescription))")
                }
                
            }
            
        }else if uploaderType == .image {
            awsUploadImage(filePath: filePath, imageData: image, index: index, progress: {( uploadProgress) in
                
                guard let progress = progress else { return }
                DispatchQueue.main.async {
                    progress(uploadProgress)
                }
                
            }) { (uploadedFileUrl,thumbNailUrl, error,index) in
                
                if let finalPath = uploadedFileUrl as? String {
                    guard let completionBlock = completion else { return }
                    completionBlock(finalPath, nil , nil, index)
                } else {
                    //print("\(String(describing: error?.localizedDescription))")
                }
                
            }
        }
        
    }
    
    func fireBaseUploader(uploaderType:uploaderType, progress: ProgressBlock?, completion: CompletionBlock?) {
        if uploaderType == .video {
            
        }else if uploaderType == .audio {
            
        }else if uploaderType == .file {
            
        }else if uploaderType == .image {
            
        }
    }
    
    func awsUploadGifImage(filePath: String, fileURL: URL, index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        AWSS3Manager.shared.uploadOtherFile(filePath: filePath, fileUrl: fileURL, conentType: "gif", progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error,index ) in
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, nil, nil, index)
            } else {
                //print("\(String(describing: error?.localizedDescription))")
            }
        }
    }
}

extension UploadManager {
    private func awsUploadImage(filePath: String = "", imageData: Data?, index: Int?, progress: ProgressBlock?, completion: CompletionBlock?) {
        AWSS3Manager.shared.uploadImage(filePath: filePath, imageData: imageData, index: index, progress: {(progressValue) in
            
            guard let uploadProgress = progress else { return }
            DispatchQueue.main.async {
                uploadProgress(progressValue)
            }
            
        }) { (uploadedFileUrl, thumbNailUrl, error,index ) in
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, nil, nil, index)
            } else {
                //print("\(String(describing: error?.localizedDescription))")
            }
            
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
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, thumbNailUrl, nil,nil)
            } else {
                //print("\(String(describing: error?.localizedDescription))")
            }
            
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
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, nil, nil,nil)
            } else {
                //print("\(String(describing: error?.localizedDescription))")
            }
            
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
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, nil, nil, nil)
            } else {
                //print("\(String(describing: error?.localizedDescription))")
            }
            
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
            
            if let finalPath = uploadedFileUrl as? String {
                guard let completionBlock = completion else { return }
                completionBlock(finalPath, nil, nil, nil)
            } else {
                print("\(String(describing: error?.localizedDescription))")
            }
            
        }
    }
}

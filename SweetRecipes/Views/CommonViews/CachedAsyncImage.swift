//
//  CachedAsyncImage.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/19/24.
//

import SwiftUI

struct CachedAsyncImage<Content>: View where Content: View {
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cachedImage = ImageCached[url] {
            content(.success(cachedImage))
        } else {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                cache(phase: phase)
            }
        }
    }
    
    private func cache(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCached[url] = image
        }
        
        return content(phase)
    }
}

#Preview {
    CachedAsyncImage(url: URL(string: MealDetail.previewData.imageUrl)!) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
        case .failure(let error):
            Text(error.localizedDescription)
        @unknown default:
            NoImagePlaceHolderView(width: 250, height: 250)
        }
    }
    .frame(width: 250, height: 250)
}

fileprivate class ImageCached {
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            return ImageCached.cache[url]
        }
        set {
            ImageCached.cache[url] = newValue
        }
    }
}

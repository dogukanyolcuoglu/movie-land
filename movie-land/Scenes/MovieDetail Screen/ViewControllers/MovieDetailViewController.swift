//
//  MovieDetailViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import UIKit
import Kingfisher

class MovieDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var movieRatePointLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var timeIconImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
        

    // MARK: - Properties
    var viewModel: MovieDetailViewModel!
    var coordinator: MovieDetailCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        timeIconImageView.image = UIImage(named: "clock")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    }
    
    func setup(_ data: MovieDetailResponse) {
        if let imageURL = data.poster, let url = URL(string: imageURL) {
            let size = self.imageView.frame.size
            let resizeProcessor = ResizingImageProcessor(referenceSize: size, mode: .none)
            self.imageView.kf.setImage(with: url, options: [.backgroundDecode,.processor(resizeProcessor), .scaleFactor(UIScreen.main.scale),.cacheOriginalImage])
        }
        movieTitleLabel.text = data.title
        movieTimeLabel.text = data.runtime
        movieRatePointLabel.text = "\(data.imdbRating ?? "")/10"
        releaseDateLabel.text = data.released
        genresLabel.text = data.genre
//        plotTextView.text = data.plot
        LoadingView.shared.hideLoaderView()
        DispatchQueue.main.async {
            self.plotTextView.textContainerInset = UIEdgeInsets.zero
            self.plotTextView.textContainer.lineFragmentPadding = 0
        }
    }
}

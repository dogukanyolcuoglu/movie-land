//
//  MovieDetailViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import UIKit
import Kingfisher
import Signals
import CoreData

class MovieDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var movieRatePointLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var timeIconImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
   
    @IBOutlet weak var saveButtonIcon: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var viewModel: MovieDetailViewModel!
    var coordinator: MovieDetailCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getMovieById()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        timeIconImageView.image = UIImage(named: "clock")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        setupSaveButtonUI(false)
        fetchDataFromCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        plotTextView.text = data.plot
        DispatchQueue.main.async {
            self.plotTextView.textContainerInset = UIEdgeInsets.zero
            self.plotTextView.textContainer.lineFragmentPadding = 0
        }
        LoadingView.shared.hideLoaderView()
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        viewModel.coreManager.configureEntity("Movies")
        if !viewModel.isSaved { saveDataToCoreData() }
        else { deleteDataFromCoreData() }
    }
    
    func saveDataToCoreData() {
        viewModel.coreManager.entity.setValue(viewModel.movieID, forKey: "id")
        if let poster = viewModel.movieDetail.poster {
            viewModel.coreManager.entity.setValue(poster, forKey: "imageUrl")
        }
        viewModel.coreManager.saveContextToEntity()
        setupSaveButtonUI(true)
    }
    
    func fetchDataFromCoreData() {
        viewModel.coreManager.configureEntity("Movies")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewModel.coreManager.managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if results.count > 0 {
                for result in results {
                    if let id = result.value(forKey: "id") as? String {
                        if id == viewModel.movieID {
                            setupSaveButtonUI(true)
                            break
                        }
                    }
                }
            }
        } catch {
            print("error")
        }
    }
    
    func deleteDataFromCoreData() {
        viewModel.coreManager.configureEntity("Movies")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate (format: "id = %@", viewModel.movieID)
        do {
            let results = try viewModel.coreManager.managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if results.count > 0 {
                for result in results {
                    if let id = result.value(forKey: "id") as? String {
                        if id == viewModel.movieID {
                            viewModel.coreManager.managedContext.delete(result)
                            viewModel.coreManager.saveContextToEntity()
                            setupSaveButtonUI(false)
                            break
                        }
                    }
                }
            }
        } catch {
            print("error")
        }
    }
    
    func setupSaveButtonUI(_ isSaved: Bool) {
        let selectedIcon = Images.Tabbar.bookMarkSelected?.withTintColor(.yellow)
        let unselectedIcon = Images.Tabbar.bookMark?.withTintColor(.yellow)
        saveButtonIcon.image = isSaved ? selectedIcon : unselectedIcon
        viewModel.isSaved = isSaved
    }
}

extension MovieDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
}

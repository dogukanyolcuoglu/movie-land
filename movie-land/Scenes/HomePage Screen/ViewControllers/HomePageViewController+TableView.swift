//
//  HomePageViewController+TableView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation
import UIKit
import SnapKit

extension HomePageViewController: UITableViewDataSource {
    
    internal func tableViewConfigure() {
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(cellType: HomepageTableViewCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        switch section {
        case .AllMoviesSection(_, let items):
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: HomepageTableViewCell.self)
            cell.selectionStyle = .none
            cell.isHorizontal = true
            cell.sectionItems = items
            return cell
        case .SearchMoviesSection(let items):
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: HomepageTableViewCell.self)
            cell.selectionStyle = .none
            cell.isHorizontal = false
            cell.sectionItems = items
            return cell
        case .EmptySection:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            let view = EmptyComponentView.loadFromNib()
            cell.addSubview(view)
            view.snp.makeConstraints { make in
                make.leading.trailing.bottom.top.equalToSuperview()
            }
            view.descriptionLabel.text = "Veri bulunamadı."
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = viewModel.sections[indexPath.section]
        switch section {
        case .EmptySection, .SearchMoviesSection: return tableView.frame.size.height
        default: return 160.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionItem = viewModel.sections[section]
        switch sectionItem {
        case .AllMoviesSection(let title, _):
            let header = HomepageHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
            header.titleLabel.text = title
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
}

extension HomePageViewController: UITableViewDelegate { }

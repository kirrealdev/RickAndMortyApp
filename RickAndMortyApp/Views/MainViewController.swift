//
//  MainViewController.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    private var viewModel = MainViewModel()
    private let mainTableViewCellIdentifier = "characterCell"
    private let detailViewIdentifier = "detailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        configureTableView()
        viewModel.loadData()
    }

    private func bindViewModel() {
        viewModel.characterData.bind({ (data) in
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        })
    }
    
    private func configureTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: String(describing: CharacterTableViewCell.self), bundle: nil), forCellReuseIdentifier: mainTableViewCellIdentifier)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainTableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = storyboard?.instantiateViewController(identifier: detailViewIdentifier) as? DetailViewController else {
            return
        }
        detailViewController.viewModel.updateDataBy(value: self.viewModel.characterData.value[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.characterData.value.isEmpty {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIdentifier) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(name: viewModel.characterData.value[indexPath.row].name, imageURL: viewModel.characterData.value[indexPath.row].image)
        
        return cell
    }
    
    
}

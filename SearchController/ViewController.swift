//
//  ViewController.swift
//  SearchController
//
//  Created by Adriana Belinski on 11/14/22.
//

import UIKit

class ViewController: UIViewController {
  
  var filteredCountries = [Country]()
  let countries = Country.GetAllCountries()
  
  lazy var tableView: UITableView = {
    let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.delegate = self
    tv.dataSource = self
    tv.register(CountryCell.self, forCellReuseIdentifier: "cell")
    
    return tv
  }()
  
  lazy var searchController: UISearchController = {
    let s = UISearchController(searchResultsController: nil)
    s.searchResultsUpdater = self
    
    s.obscuresBackgroundDuringPresentation = false
    s.searchBar.placeholder = "Search Counteries..."
    s.searchBar.sizeToFit()
    s.searchBar.searchBarStyle = .prominent
    
    s.searchBar.scopeButtonTitles = ["All", "Europe", "Asia", "Africa"]
    
    s.searchBar.delegate = self
    
    return s
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.backgroundColor = .white
    
    setupElements()
  }

  func filterContentForSearchText(searchText: String, scope: String = "All") {
    filteredCountries = countries.filter({ (country: Country) -> Bool in
      let doesCategoryMatch = (scope == "All") || (country.continent == scope)
      
      if isSearchBarEmpty() {
        return doesCategoryMatch 
      } else {
        return doesCategoryMatch && country.title.lowercased().contains(searchText.lowercased())
      }
    })
    
    tableView.reloadData()
  }

  func isSearchBarEmpty() -> Bool {
    return searchController.searchBar.text?.isEmpty ?? true // If nothing in this, return true.
  }
  
}

extension ViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
  
}

extension ViewController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    
  }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  //Choosing height for cells
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
            CountryCell else {
      return UITableViewCell()
    }
    
    cell.titleLbl.text = countries[indexPath.row].title
    cell.categoryLbl.text = countries[indexPath.row].continent
    
    return cell
  }
}


extension ViewController {
  
  func setupElements() {
    view.addSubview(tableView)
    
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true


  }
  
}

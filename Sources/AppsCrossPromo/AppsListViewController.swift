//
//  AppsListViewController.swift
//  
//
//  Created by cuipanjun on 2025/3/13.
//


import UIKit

@objcMembers
public class AppsListViewController: UIViewController {

    private let apps: [AppInfo]
    private let tableView = UITableView()

    // Objective-C compatible initializer (NSArray)
    public init(apps: [AppInfo]) {
        self.apps = apps
        super.init(nibName: nil, bundle: nil)
    }

    @objc public convenience init(appsArray: NSArray) {
        let swiftApps = appsArray.compactMap { $0 as? AppInfo }
        self.init(apps: swiftApps)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "More Apps"
        view.backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AppCell.self, forCellReuseIdentifier: "AppCell")
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AppsListViewController: UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apps.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as? AppCell else {
            return UITableViewCell()
        }
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let app = apps[indexPath.row]
        if let url = URL(string: app.appStoreLink) {
            UIApplication.shared.open(url)
        }
    }
}
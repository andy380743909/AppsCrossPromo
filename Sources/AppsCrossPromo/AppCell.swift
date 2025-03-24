//
//  AppCell.swift
//  
//
//  Created by cuipanjun on 2025/3/13.
//


import UIKit

@objcMembers
public class AppCell: UITableViewCell {

    private let iconImageView = UIImageView()
    private let nameLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let getButton = UIButton(type: .system)
    
    private var appStoreLink: String = ""

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.layer.cornerRadius = 12
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.borderColor = UIColor.lightGray.cgColor
        iconImageView.layer.borderWidth = 1 / UIScreen.main.scale
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 2
        subtitleLabel.lineBreakMode = .byTruncatingTail
        
        // StackView setup
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(subtitleLabel)
        
        getButton.translatesAutoresizingMaskIntoConstraints = false
        getButton.setTitle("VIEW", for: .normal)
        getButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        getButton.backgroundColor = .systemGray5
        getButton.layer.cornerRadius = 14
        getButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 28).isActive = true

        let stack = UIStackView(arrangedSubviews: [iconImageView, textStackView, getButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center

        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        getButton.addTarget(self, action: #selector(getButtonTapped), for: .touchUpInside)
    }

    public func configure(with app: AppInfo) {
        nameLabel.text = app.name
        subtitleLabel.text = app.subtitle
        appStoreLink = app.appStoreLink

        if let image = UIImage(named: app.iconName) {
            iconImageView.image = image
        } else {
            iconImageView.image = UIImage(systemName: "app")
        }
    }

    @objc private func getButtonTapped() {
        if let url = URL(string: appStoreLink) {
            UIApplication.shared.open(url)
        }
    }
}

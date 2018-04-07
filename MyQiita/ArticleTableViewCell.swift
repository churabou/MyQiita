//
//  ArticleTableViewCell.swift
//  MyQiita
//
//  Created by ちゅーたつ on 2018/04/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import SnapKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    static let height: CGFloat = 100
    private var iconView = UIImageView()
    private var idLabel = UILabel()
    private var titleLabel = UILabel()
    private var timeLabel = UILabel()
    private var tagLabel = UILabel()
    
    
    func initializeView() {
        
        contentView.addSubview(iconView)

        idLabel.font = UIFont.systemFont(ofSize: 14)
        idLabel.textColor = .gray
        idLabel.textAlignment = .left
        contentView.addSubview(idLabel)
        
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)

        tagLabel.font = UIFont.systemFont(ofSize: 12)
        tagLabel.textColor = .gray
        contentView.addSubview(tagLabel)
    }
    
    
    
    //親Viewに制約がないと呼ばれないでしょ。
    override func updateConstraints() {
        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.size.equalTo(20)
        }
        
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(iconView.snp.right).offset(5)
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    func configure(item: Item) {
        iconView.kf.setImage(with:  URL(string: item.user.iconUrl))
        titleLabel.text = item.title
        idLabel.text = item.user.id
        
        var tagString = ""
        item.tags.forEach { tagString += " \($0.name)"}
        tagLabel.text = tagString
    }
    
//    override func draw(_ rect: CGRect) {
//        tagLabel.layer.cornerRadius = tagLabel.frame.height/2
//        tagLabel.layer.borderColor = UIColor.pink.cgColor
//        tagLabel.layer.borderWidth = 1
//    }
}

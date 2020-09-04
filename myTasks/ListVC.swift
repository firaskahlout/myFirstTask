//
//  ListVC.swift
//  myTasks
//
//  Created by IFone on 9/11/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    
    var lastSelectedIndex = 0
    var lastSelectedIndex2 = 0
    var todo :TodoForCell
    
    var sections = ["SSH Console", "Load Balancer"]
    
    var labels = ["Virtual Services", "Pools", "Nodes", "Servers"]
    
    
    required init?(coder aDecoder: NSCoder) {
        todo = TodoForCell()
        todo.setData()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var viewForShadow: UIView!
    
    @IBOutlet weak var myCollectionViewLbl: UICollectionView!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var addBtn: UIButton!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionViewLbl.delegate = self
        myCollectionViewLbl.dataSource = self
    
        setUpNavigationBar()
        
        viewForShadow.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        let width = viewForShadow.frame.width
        let height = viewForShadow.frame.height
        let shadowSize: CGFloat = 12
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize * 0.4), width: width + shadowSize * 2, height: shadowSize-2)
        viewForShadow.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        viewForShadow.layer.shadowRadius = 3
        viewForShadow.layer.shadowOpacity = 1
        
        addBtn.layer.cornerRadius = 27.5
        addBtn.layer.shadowColor = UIColor.black.cgColor
        addBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        addBtn.layer.shadowRadius = 3
        addBtn.layer.shadowOpacity = 0.5
        myTableView.rowHeight = 78
    }

    private func setUpNavigationBar(){
        let view = UIView.instanceFromNib(with: "RightNavigationItems")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension ListVC : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todo.array.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 0.6)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ListCell
        
        cell.nameLbl.text = todo.array[indexPath.section].name
        cell.noteLbl.text = todo.array[indexPath.section].note
        cell.idLbl.text = todo.array[indexPath.section].id
        if todo.array[indexPath.section].isconnected{
            cell.imgView.tintColor = UIColor.black
            cell.redView.backgroundColor = UIColor.red
        }else{
            cell.imgView.tintColor = UIColor.lightGray
            cell.redView.backgroundColor = UIColor.lightGray
        }
        if todo.array[indexPath.section].vipUser {
            cell.vipLbl.isHidden = false
            
        }else{
            cell.vipLbl.isHidden = true
            
        }
        return cell
    }
    
}

extension ListVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView {
            return sections.count
        }
        if collectionView == myCollectionViewLbl {
            return labels.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == myCollectionView{
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CollectionCell
            
            cell.sectionLbl.text = sections[indexPath.row]
            
            if indexPath.row == lastSelectedIndex{
                cell.ProBar.progress = 1
            }
            return cell
        }
        
        if collectionView == myCollectionViewLbl {
            let cell2 = myCollectionViewLbl.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionCellLbl
            
            cell2.label.text = labels[indexPath.row]
            
            return cell2
            
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == myCollectionView{
            let cell = myCollectionView.cellForItem(at: indexPath) as! CollectionCell
            
            let cll = myCollectionView.cellForItem(at: IndexPath(row: lastSelectedIndex, section: 0)) as! CollectionCell
            cll.ProBar.progress = 0
            lastSelectedIndex = indexPath.row
            cell.ProBar.progress = 1
        }
        
        if collectionView == myCollectionViewLbl{
            let cell = myCollectionViewLbl.cellForItem(at: indexPath) as! CollectionCellLbl
            
            let cll = myCollectionViewLbl.cellForItem(at: IndexPath(row: lastSelectedIndex2, section: 0)) as! CollectionCellLbl
            cll.viewOfLabel.backgroundColor = nil
            cll.label.textColor = UIColor.black
            
            lastSelectedIndex2 = indexPath.row
            cell.viewOfLabel.backgroundColor = UIColor(red: 63/255 , green: 70/255, blue: 90/255, alpha: 1.0)
            cell.label.textColor = UIColor.white
            myCollectionViewLbl.scrollToItem(at: indexPath, at: .right, animated: true)
            
            
            
        }
       
        
        
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == myCollectionViewLbl {
            let text = labels[indexPath.row].count
            
            return CGSize(width: (text * 8) + 50, height: 60)
        }else{
            let text = sections[indexPath.row].count
            
            return CGSize(width: (text * 8) + 80, height: 60)
        }
        
    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }
    
    
    
    
}


extension ListVC: UISearchResultsUpdating ,UISearchControllerDelegate{
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

extension UIView {
    class func instanceFromNib(with name: String) -> UIView {
        return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

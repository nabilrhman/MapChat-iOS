//
//  ViewController.swift
//  NotesiOS
//
//  Created by Nabil Rahman on 10/23/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit
//
//let firstFolderNotes = [
//    Note(title: "UITableViews", date: Date(), text: "Table views use protocols to receive data."),
//    Note(title: "CollectionViews", date: Date(), text: "Collection views can be customized to crreate flow layouts pinterest"),
//    Note(title: "Flow Layouts", date: Date(), text: "Custom layouts can be made with bla bla bla")
//]
//
//let secondFolderNotes = [
//    Note(title: "UITableViews", date: Date(), text: "I have 2 insta"),
//    Note(title: "CollectionViews", date: Date(), text: "Youtube Channels"),
//    Note(title: "Flow Layouts", date: Date(), text: "I have have Facebook. Bla. bla bla...")
//]
//
//var noteFolders: [NoteFolder] = [
//    NoteFolder(title: "Course Notew", notes: firstFolderNotes),
//    NoteFolder(title: "Social Media", notes: secondFolderNotes)
//]

var noteFolders = [NoteFolder]()

extension FoldersController {
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete")
        { (rowAction, indexPath) in
            let noteFolder = noteFolders[indexPath.row]
            if CoreDataManager.shared.deleteNoteFolder(noteFolder: noteFolder) {
                noteFolders.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteFolders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! FolderCell
        let folderForRow = noteFolders[indexPath.row]
        cell.folderData = folderForRow
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let folderNotesController = FolderNotesController();
        let folderForRowSelected = noteFolders[indexPath.row]
        folderNotesController.folderData = folderForRowSelected
        navigationController?.pushViewController(folderNotesController, animated: true)
        
    }
    
}

class FoldersController: UITableViewController {

    fileprivate let CELL_ID: String = "CELL_ID"
    
    fileprivate let headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let label = UILabel(frame: CGRect(x: 20, y: 15, width: 200, height: 20))
        label.text = "ALL NOTEBOOKS"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        headerView.addBorder(toSide: .bottom, withColor: UIColor.lightGray.withAlphaComponent(0.5).cgColor, andThickness: 0.3)
        headerView.addSubview(label)
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Notebooks"
        noteFolders = CoreDataManager.shared.fetchNoteFolders()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: true)
    
        let items:[UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "New folder", style: .done, target: self, action: #selector(self.handleAddNewFolder))
        ]
        
        self.toolbarItems = items
//        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
//        self.navigationItem.setRightBarButton(editButton, animated: false)
//        self.navigationController?.toolbar.tintColor = .primaryColor
//        self.navigationController?.navigationBar.tintColor = .primaryColor
        
        self.tableView.reloadData()
        
//        setupTranslucentViews()
    }
    
    var textField: UITextField!
    
    @objc fileprivate func handleAddNewFolder() {
        
        let addAlert = UIAlertController(title: "New Notebook", message: "Enter a name for this notebook", preferredStyle: .alert)
        
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            addAlert.dismiss(animated: true)
        }))
        
        addAlert.addTextField { (tf) in
            self.textField = tf
        }
        
        addAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (_) in
            guard let title = self.textField.text else { return }
            let newFolder = CoreDataManager.shared.createNoteFolder(title: title)
            noteFolders.append(newFolder)
            self.tableView.insertRows(at: [IndexPath(row: noteFolders.count - 1, section: 0)], with: .fade)
        }))
        
        present(addAlert, animated: true)
    }
    
    fileprivate func setupTableView() {
        tableView.register(FolderCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.tableHeaderView = headerView
    }
    
    fileprivate func getImage(withColor color: UIColor, andSize size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    fileprivate func setupTranslucentViews() {
        let toolBar = self.navigationController?.toolbar
        let navigationBar = self.navigationController?.navigationBar
        let slightWhite = getImage(withColor: UIColor.white.withAlphaComponent(0.9), andSize: CGSize(width: 30, height: 30))
        toolBar?.setBackgroundImage(slightWhite, forToolbarPosition: .any, barMetrics: .default)
        toolBar?.setShadowImage(UIImage(), forToolbarPosition: .any)
        navigationBar?.setBackgroundImage(slightWhite, for: .default)
        navigationBar?.shadowImage = slightWhite
    }


}


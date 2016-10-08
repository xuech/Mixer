//
//  MixersViewController.swift
//  Mixer
//
//  Created by xuech on 16/9/30.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit

fileprivate let MixerCellIdentifierID = "MixerViewCell"

class MixersViewController: UITableViewController {

    var mixers = [Mixer](){
        didSet{
            tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        
        mixers = Mixer.loadAllMixers()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mixers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MixerCellIdentifierID, for: indexPath)as! MixerViewCell
        let mixer = mixers[indexPath.row]
        cell.mixer = mixer
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UITableViewCell, let selectedRowIndex = (tableView.indexPath(for: selectedCell) as NSIndexPath?)?.row
            , segue.identifier == "showMixerDetailsSegue" else {
                fatalError("sender is not a UITableViewCell or was not found in the tableView, or segue.identifier is incorrect")
        }
        
        let mixer = mixers[selectedRowIndex]
        let detailViewController = segue.destination as! MixerDetailsViewController
        detailViewController.mixer = mixer
    }



}

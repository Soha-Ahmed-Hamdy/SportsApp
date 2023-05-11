//
//  EventViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import UIKit

class EventViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate{
    
    
    
    @IBOutlet weak var noTeam: UILabel!
    @IBOutlet weak var collectinEvent: UICollectionView!
    @IBOutlet weak var collectionResult: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var eventList: Fixtures?
    var latestList: Livescore?
    var teamsList : Teams?
    var placeHolderImg : String?
    var sportType: String?
    var leagId: Int?
    var playersId : [Int]? = []
    var viewModel : ViewModel!


    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectinEvent{
            return eventList?.result?.count ?? 1
        }else{
            if sportType == "tennis"{
                if playersId?.count == 0{
                    noTeam.text = "No Teams here"
                }else{
                    noTeam.text = ""
                }
                return playersId?.count ?? 0
            }else{
                return teamsList?.result?.count ?? 0
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == collectinEvent{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventItem", for: indexPath) as! EventCollectionViewCell
            
            if(eventList?.result?.count == nil){
                cell.gameDate.text = "No Result"
                cell.firstTeam.text = ""
                cell.secTeam.text = ""
                cell.gameTime.text = "Try Soon"
            }else{
                if sportType == "football"{
                    
                    //assign data to cell
                    var leagueImage1 : String = ""
                    var leagueImage2 : String = ""
                    if (eventList?.result?[indexPath.row].home_team_logo) != nil{
                        leagueImage1 = (eventList?.result?[indexPath.row].home_team_logo)!
                    }else{
                        leagueImage1 = ""
                    }
                    if (eventList?.result?[indexPath.row].away_team_logo) != nil{
                        leagueImage2 = (eventList?.result?[indexPath.row].away_team_logo)!
                    }else{
                        leagueImage2 = ""
                    }
                    
                    
                    cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                    cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                    cell.firstTeam.text = eventList?.result?[indexPath.row].event_home_team
                    cell.secTeam.text = eventList?.result?[indexPath.row].event_away_team
                    cell.gameDate.text = eventList?.result?[indexPath.row].event_date
                    cell.gameTime.text = eventList?.result?[indexPath.row].event_time
                  
                    
                }else{
                    
                    //assign data to cell
                    
                    
                    if sportType == "tennis"{
                        var leagueImage1 : String = ""
                        var leagueImage2 : String = ""
                        
                        if (eventList?.result?[indexPath.row].event_first_player_logo) != nil{
                            leagueImage1 = (eventList?.result?[indexPath.row].event_first_player_logo)!
                        }else{
                            leagueImage1 = ""
                        }
                        
                        if (eventList?.result?[indexPath.row].event_second_player_logo) != nil{
                            leagueImage2 = (eventList?.result?[indexPath.row].event_second_player_logo)!
                        }else{
                            leagueImage2 = ""
                        }
                        cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                        cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                        
                        cell.firstTeam.text = eventList?.result?[indexPath.row].event_first_player
                        cell.secTeam.text = eventList?.result?[indexPath.row].event_second_player
                        
                        
                        
                    }else{
                        var leagueImage1 : String = ""
                        var leagueImage2 : String = ""
                        
                        if (eventList?.result?[indexPath.row].event_home_team_logo) != nil{
                            leagueImage1 = (eventList?.result?[indexPath.row].event_home_team_logo)!
                        }else{
                            leagueImage1 = ""
                        }
                        
                        if (eventList?.result?[indexPath.row].event_away_team_logo) != nil{
                            leagueImage2 = (eventList?.result?[indexPath.row].event_away_team_logo)!
                        }else{
                            leagueImage2 = ""
                        }
                        
                        cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                        cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                        
                        cell.firstTeam.text = eventList?.result?[indexPath.row].event_home_team
                        cell.secTeam.text = eventList?.result?[indexPath.row].event_away_team
                        
                        
                    }
                    
                    
                    if sportType == "cricket"{
                        cell.gameDate.text = eventList?.result?[indexPath.row].event_date_start

                    }else{
                        cell.gameDate.text = eventList?.result?[indexPath.row].event_date

                    }
                    
                    cell.gameTime.text = eventList?.result?[indexPath.row].event_time
                  
                }
               
            }
            
            
            cell.layer.cornerRadius = 50.0
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.borderWidth = 2
            cell.clipsToBounds = true
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsItem", for: indexPath) as! TeamsCollectionViewCell
        
        cell.layer.borderColor = UIColor(named: "recyclerColor")?.cgColor
        cell.layer.borderWidth = 2
        cell.TeamImg.layer.cornerRadius = 58
        cell.layer.cornerRadius = 58
        cell.contentMode = .scaleAspectFill
        cell.clipsToBounds = true

        
        if sportType == "tennis"{
                    
            //assign data to cell
            
            cell.TeamImg.image = UIImage(named: placeHolderImg!)
                
            
        }else{
            var unwrappedImage : String = ""
            if (teamsList?.result?[indexPath.row].team_logo) != nil{
                unwrappedImage = (teamsList?.result?[indexPath.row].team_logo)!
            }else{
                unwrappedImage = ""
            }
            
            cell.TeamImg.sd_setImage(with: URL(string: unwrappedImage), placeholderImage: UIImage(named: placeHolderImg!))
            print(teamsList?.result?[indexPath.row].team_logo ?? "photo null")
            
        }
        
        return cell

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionResult {
            
            if sportType == "football"{
                
                let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
                detailsVC.team = teamsList?.result?[indexPath.row]
                detailsVC.placeHolderD = placeHolderImg
                detailsVC.sportType = sportType
                self.navigationController?.pushViewController(detailsVC, animated: true)
                
            }else if sportType == "tennis"{
                
                viewModel.getPlayer(sportType: sportType!, playerId: (playersId?[indexPath.row])!)
                viewModel.bindResultToViewControllerPlayer = {() in self.getPlayer()}
                
                
            }else{
                
                let confirmAction = UIAlertAction(title: "OK", style: .default)
                MakeAlert.displayAlert(title: "Warning!!", message: "No players in this team.. ", action: confirmAction, controller: self)
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestList?.result?.count ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultTableViewCell
        
        //table disgn
        cell.layer.cornerRadius = 50.0
        cell.layer.borderColor = UIColor(named: "recyclerColor")?.cgColor
        cell.layer.borderWidth = 2
        cell.clipsToBounds = true
        
        if(latestList?.result?.count == nil){
            
            cell.gameDate.text = "No Result"
            cell.firstTeam.text = ""
            cell.secTeam.text = ""
            cell.score.text = "Sorry"
            cell.gameTime.text = "Try Soon"
            
        }else{
            
            if sportType == "football" {
                
                //assign data to cell
                var leagueImage1 : String = ""
                var leagueImage2 : String = ""
                if (latestList?.result?[indexPath.row].home_team_logo) != nil{
                    leagueImage1 = (latestList?.result?[indexPath.row].home_team_logo!)!
                }else{
                    leagueImage1 = ""
                }
                if (latestList?.result?[indexPath.row].away_team_logo) != nil{
                    leagueImage2 = (latestList?.result?[indexPath.row].away_team_logo!)!
                }else{
                    leagueImage2 = ""
                }
                
                
                cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                
                cell.firstTeam.text = latestList?.result?[indexPath.row].event_home_team
                cell.secTeam.text = latestList?.result?[indexPath.row].event_away_team
                cell.gameDate.text = latestList?.result?[indexPath.row].event_date
                cell.gameTime.text = latestList?.result?[indexPath.row].event_time
                cell.score.text = latestList?.result?[indexPath.row].event_final_result
            
                
                
                
            }else{
                
                //assign data to cell
                
                
                if sportType == "cricket"{
                    cell.gameDate.text = eventList?.result?[indexPath.row].event_date_start
                    cell.score.text = latestList?.result?[indexPath.row].event_home_final_result


                }else{
                    cell.gameDate.text = eventList?.result?[indexPath.row].event_date
                    cell.score.text = latestList?.result?[indexPath.row].event_final_result


                }
                
                if sportType == "tennis"{
                    
                    var leagueImage1 : String = ""
                    var leagueImage2 : String = ""
                    if (latestList?.result?[indexPath.row].event_first_player_logo) != nil{
                        leagueImage1 = (latestList?.result?[indexPath.row].event_second_player_logo!)!
                    }else{
                        leagueImage1 = ""
                    }
                    if (latestList?.result?[indexPath.row].event_away_team_logo) != nil{
                        leagueImage2 = (latestList?.result?[indexPath.row].event_away_team_logo!)!
                    }else{
                        leagueImage2 = ""
                    }
                    
                    
                    cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                    cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                    
                    
                    cell.firstTeam.text = latestList?.result?[indexPath.row].event_first_player
                    cell.secTeam.text = latestList?.result?[indexPath.row].event_second_player


                }else{
                    
                    var leagueImage1 : String = ""
                    var leagueImage2 : String = ""
                    if (latestList?.result?[indexPath.row].event_home_team_logo) != nil{
                        leagueImage1 = (latestList?.result?[indexPath.row].event_home_team_logo!)!
                    }else{
                        leagueImage1 = ""
                    }
                    if (latestList?.result?[indexPath.row].event_away_team_logo) != nil{
                        leagueImage2 = (latestList?.result?[indexPath.row].event_away_team_logo!)!
                    }else{
                        leagueImage2 = ""
                    }
                    
                    
                    cell.firstImg.sd_setImage(with: URL(string: leagueImage1), placeholderImage: UIImage(named: placeHolderImg!))
                    cell.secImg.sd_setImage(with: URL(string: leagueImage2), placeholderImage: UIImage(named: placeHolderImg!))
                    
                    
                    cell.firstTeam.text = latestList?.result?[indexPath.row].event_home_team
                    cell.secTeam.text = latestList?.result?[indexPath.row].event_away_team
                }
                cell.gameTime.text = latestList?.result?[indexPath.row].event_time
            }
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width , height : CGFloat?
        if collectionView == collectinEvent{
            width = (collectionView.frame.size.width) - 20
            height = (collectionView.frame.size.height)

        }else if collectionView == collectionResult {
            width = (collectionView.frame.size.width)
            height = (collectionView.frame.size.height)/5
        }

        return CGSize(width: width!, height: height!)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        let todayDate = Date()
        let calender = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let weekStart = calender.date(byAdding: .day,value: 7 ,to: todayDate)
        let today = dateFormatter.string(from: todayDate)
        let weekDate = dateFormatter.string(from: weekStart!)
        print("ssss")
        
        
        viewModel.getEvents(sportType: sportType!, todayDate: today, weekStart: weekDate, legKey: leagId!)
        viewModel.getLivescore(sportType: sportType!, legKey: leagId!)
        viewModel.getTeam(sportType: sportType!, legKey: leagId!)
        
        
        viewModel.bindResultToViewControllerEvent = {() in self.renderEventsView()}
        viewModel.bindResultToViewControllerLatest = {() in self.renderLiveScoreView()}
        viewModel.bindResultToViewControllerTeam = {() in self.renderTeamsView()}
     
    }
    
    
    func renderEventsView(){
        
        DispatchQueue.main.async {
            self.eventList = self.viewModel.VWResultEvent
            self.title = "League Details"
            self.collectinEvent.reloadData()
            print("success event")
            
            if self.sportType == "tennis"{
                self.eventList?.result?.forEach { element in
                    self.playersId?.append(element.first_player_key!)
                    self.playersId?.append(element.second_player_key!)

                }
                self.collectionResult.reloadData()
            }
        }
    }
    
    
    func renderLiveScoreView(){
        
        DispatchQueue.main.async {
            self.latestList = self.viewModel.VWResultLiveScore
            self.tableView.reloadData()
            print("success in live")
            
        }
    }
    
    func renderTeamsView(){
        
        DispatchQueue.main.async {
            self.teamsList = self.viewModel.VWResultTeam
            self.collectionResult.reloadData()
            print("success in teams")
        
        }
    }
    
    func getPlayer(){
        
        DispatchQueue.main.async {
            let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoViewController") as! PlayerInfoViewController
            playerVC.sportType = self.sportType
            playerVC.player = self.viewModel.VWResultPlayer?.result?[0]
            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
    
    
}

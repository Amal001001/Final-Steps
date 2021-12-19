//  FilmViewController.swift
//  GET People

import UIKit

class FilmViewController: UITableViewController {

    var films = [String]()
    var releaseDate = [String]()
    var director = [String]()
    var openingCrawl = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //without mvc
//        // specify the url that we will be sending the GET request to
//                let url = URL(string: "https://swapi.dev/api/films/?format=json")
//                // create a URLSession to handle the request tasks
//                let session = URLSession.shared
//                // create a "data task" to make the request and run completion handler
//                let task = session.dataTask(with: url!, completionHandler: {
//                    // see: Swift closure expression syntax
//                    data, response, error in
//                    // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
//                    // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
//                    do {
//                        // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
//                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                         //   print(jsonResult)
//                            // Why do we need to optionally unwrap jsonResult["results"]
//                                // Try it without the optional unwrapping and you'll see that the value is actually an optional
//                                if let results = jsonResult["results"] {
//                                // coercing the results object as an NSArray and then storing that in resultsArray
//                                    let resultsArray = results as! NSArray
//                                    // now we can run NSArray methods like count and firstObject
//                                    for person in resultsArray {
//                                        let personDict = person as! NSDictionary
//                                        self.films.append(personDict["title"]! as! String)
//                                    }
//
//                                }
//                        }
//                        DispatchQueue.main.async {
//                              self.tableView.reloadData()
//                        }
//                    } catch {
//                        print(error)
//                    }
//                })
//                // execute the task and then wait for the response
//                // to run the completion handler. This is async!
//                task.resume()
        
/////////////////////////////////////////
        // with mvc
        StarWarsModel.getAllFilms(completionHandler: {
            // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        let personDict = person as! NSDictionary
                                        self.films.append(personDict["title"]! as! String)
                                        self.releaseDate.append(personDict["release_date"]! as! String)
                                        self.director.append(personDict["director"]! as! String)
                                        self.openingCrawl.append(personDict["opening_crawl"]! as! String)
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("Something went wrong")
                        }
                })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = films[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }

    //when cell clicked --> show details in another view controller (filmVC)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         let filmVC = self.storyboard?.instantiateViewController(withIdentifier: "FilmDetailsViewController") as! FilmDetailsViewController
                     
         // sending data to FilmDetailsViewController
         filmVC.filmTitle = "Title : \(films[indexPath.row])"
         filmVC.releaseDate = "Release date: \(releaseDate[indexPath.row])"
         filmVC.director = "Director: \(director[indexPath.row])"
         filmVC.openingCrawl = "Opening Crawl: \(openingCrawl[indexPath.row])"
         
         self.present(filmVC, animated: true, completion: nil) }
}

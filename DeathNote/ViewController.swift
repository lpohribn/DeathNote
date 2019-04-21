//
//  ViewController.swift
//  DeathNote
//
//  Created by Liudmyla POHRIBNIAK on 4/04/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import UIKit


protocol Done {
    func addPeople(person: Person)
}

class CustomCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptDeath: UILabel!
    @IBOutlet weak var dateOfDeath: UILabel!
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as? CustomCell
        cell?.name?.text = people[indexPath.row].name
        cell?.descriptDeath?.text = people[indexPath.row].description
        cell?.dateOfDeath?.text = dateFormatter.string(for: people[indexPath.row].date)
        return cell!
        
    }
}


class ViewController: UIViewController, Done {
    
    var people: [Person] = [
        Person("Billy", "DEATH FROM DEODORANT:He was so pure that he required uninterrupted prosperity to be full of deodorant aerosol. Even when his health began to deteriorate rapidly, his parents did not lose consciousness. It is shown that its amount in the blood is 10 times higher than normal.", Date())!,
        Person("Helly", "DEATH FROM BRA: woman was ruined metal wire, used as a 'bone' in their bras. The ladies strolled through Hyde Park in London, when the strongest thunderstorm began. They tried to find shelter under a large tree and this was not the best idea: lightning hit both at once, and the metal on the body served as an excellent conductor.", Date())!,
        Person("Cyan", "DEATH FROM GAME: he was carried away by the game of “Starcraft” on the network that was spent 50 hours straight in an Internet café, distracting only for short breaks for sleeping and going to the toilet. When he suddenly became ill, he was taken to the hospital in an ambulance, but it was too late: the 28-year-old Korean died from cardiac arrest caused by severe exhaustion.", Date())!]
    
    
    func addPeople(person: Person) {
        people.append(person)
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}


//
//  ViewController.swift
//  arrrrr-pg
//
//  Created by David Stroud on 04/02/2016.
//  Copyright © 2016 David Stroud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    @IBAction func chestTapped(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
        // need to add code to STOP attack button being pressed AFTER chest is tapped but BEFORE enemy is re-generated
        
    }

    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHpLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was Unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) collected \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "BraveSirKnight", hp: 110, attackPower: 20)
        
        generateRandomEnemy()
        
        playerHpLabel.text = "\(player.hp) HP"
        
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        enemyImage.hidden = false
        enemyHpLabel.text = "\(enemy.hp) HP"
    }
    
}


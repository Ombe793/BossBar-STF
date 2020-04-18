<?php

namespace BossBar;

use pocketmine\{Server, Player,
scheduler\Task};
use BossBar\Main;

class BossTask extends Task {
  
  private $plugin;
  public function __construct(Main $plugin){
    $this->p = $plugin;
  }
  
  public function onRun($task){
    foreach($this->p->getServer()->getDefaultLevel()->getPlayers() as $pl){
    $eid = 54;
    $vida = 50;
    switch(rand(1,2)){
        case 1:
          $this->p->getBoss()->updateFor($pl, $eid, 'BossUpdate', $vida);
				break;
				case 2:
					$this->p->getBoss()->updateFor($pl, $eid, 'BossUpdate', $vida);
				break;
       }
     }
  }
}
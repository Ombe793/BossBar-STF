<?php

namespace BossBar;

use pocketmine\{Server, Player, plugin\PluginBase};
use pocketmine\utils\Config;
use pocketmine\event\Listener;
use pocketmine\event\player\{PlayerMoveEvent, PlayerJoinEvent};
use litek\API;
use BossBar\BossTask;

class Main extends PluginBase implements Listener {
  
  public $view = true;
  public function onEnable(){
    $this->getLogger()->info("§dBossBar Plugin");
    $this->getLogger()->info("§7[§aInfo En Español§7] §bactualización próximamente nombres random");
    $this->getLogger()->info("§7[§aInfo in English§7] §bupdate soon random names");
    $this->boss = new API(100);
    $this->getServer()->getPluginManager()->registerEvents($this, $this);
    $titles = new Config($this->getDataFolder()."BossNames.yml", Config::YAML, ['TitleBoss' => '§7[§aName§7] §bBienvenido al Server', 'SubTitleBoss' => '§7[§aName§7] §bWelcome to Server',]);
    $this->getServer()->getScheduler()->scheduleRepeatingTask(new BossTask($this), 20);
    @mkdir($this->getDataFolder());
  }
  
  public function getBoss(){
    return $this->boss;
  }
  
  public function onJoin(PlayerJoinEvent $ev){
    $pl = $ev->getPlayer();
    $pl->sendMessage("§a{$pl->getName()} §bMuevete para Activar la BossBar");
  }
  
  public function onMove(PlayerMoveEvent $ev) : void {
    $pl = $ev->getPlayer();
    $name = $pl->getName();
    $config = new Config($this->getDataFolder().'BossNames.yml', Config::YAML);
    $titleboss = $config->get('TitleBoss');
    $subtitleboss = $config->get('SubTitleBoss');
    $title = "{$titleboss} §f\n\n {$subtitleboss}";
   $this->getBoss()->showTo($pl, $title, $this->view);
  }
}

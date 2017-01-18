package component;

import slappy.Bass;

import luxe.Component;
import luxe.Entity;

import entity.Player;

class Controls extends Component {

    var player : Player;
    var speed : Float = 1.5;

    override function onadded() {

        player = cast entity;

    } //onadded

    override function init() {



    } //init

    override function update( dt:Float ) {

        player.acceleration.y = (-Bass.BoolToInt(Luxe.input.inputdown("up")) + Bass.BoolToInt(Luxe.input.inputdown("down"))) * speed;
        player.acceleration.x = (-Bass.BoolToInt(Luxe.input.inputdown("left")) + Bass.BoolToInt(Luxe.input.inputdown("right"))) * speed;

    } //update

} //Controls
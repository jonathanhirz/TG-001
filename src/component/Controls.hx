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

        player.acceleration.y = (-Bass.bool_to_int(Luxe.input.inputdown("up")) + Bass.bool_to_int(Luxe.input.inputdown("down"))) * speed;
        player.acceleration.x = (-Bass.bool_to_int(Luxe.input.inputdown("left")) + Bass.bool_to_int(Luxe.input.inputdown("right"))) * speed;

    } //update

} //Controls
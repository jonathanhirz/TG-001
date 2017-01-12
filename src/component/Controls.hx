package component;

import slappy.Tools;

import luxe.Component;
import luxe.Entity;

import entity.Player;

class Controls extends Component {

    var left_pressed : Int = 0;
    var right_pressed : Int = 0;
    var up_pressed : Int = 0;
    var down_pressed : Int = 0;

    var player : Player;
    var speed : Float = 1.5;

    override function onadded() {

        player = cast entity;

    } //onadded

    override function init() {



    } //init

    override function update( dt:Float ) {

        player.acceleration.y = (-Tools.BoolToInt(Luxe.input.inputdown("up")) + Tools.BoolToInt(Luxe.input.inputdown("down"))) * speed;
        player.acceleration.x = (-Tools.BoolToInt(Luxe.input.inputdown("left")) + Tools.BoolToInt(Luxe.input.inputdown("right"))) * speed;

    } //update


} //Controls
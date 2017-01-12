package component;

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

        if(Luxe.input.inputdown("up")) {
            up_pressed = -1;
        }
        if(Luxe.input.inputreleased("up")) {
            up_pressed = 0;
        }
        if(Luxe.input.inputdown("down")) {
            down_pressed = 1;
        }
        if(Luxe.input.inputreleased("down")) {
            down_pressed = 0;
        }
        if(Luxe.input.inputdown("left")) {
            left_pressed = -1;
        }
        if(Luxe.input.inputreleased("left")) {
            left_pressed = 0;
        }
        if(Luxe.input.inputdown("right")) {
            right_pressed = 1;
        }
        if(Luxe.input.inputreleased("right")) {
            right_pressed = 0;
        }

        player.acceleration.y = (up_pressed + down_pressed) * speed;
        player.acceleration.x = (left_pressed + right_pressed) * speed;


    } //update



} //Controls
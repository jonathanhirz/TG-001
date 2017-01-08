package states;

import luxe.States;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

import entity.*;

class GameState extends State {

    var player : Player;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {

        player = new Player();

    } //init

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {

        player.destroy();


    } //onleave

    override function update( dt:Float ) {


    } //update

} //GameState
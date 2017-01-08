package component;

import luxe.Component;
import luxe.Entity;

import entity.Player;

class Controls extends Component {

    var player : Player;

    override function onadded() {

        player = cast entity;

    } //onadded

    override function init() {



    } //init

    override function update( dt:Float ) {



    } //update



} //Controls
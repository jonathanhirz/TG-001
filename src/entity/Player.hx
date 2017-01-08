package entity;

import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import component.Controls;

class Player extends Sprite {

    public function new() {

        super({
            name : 'player',
            pos : new Vector(100, 100),
            size : new Vector(32, 32),
            color : new Color().rgb(0x7d8eff)
        });
        add(new Controls());

    } //new

    override function update( dt:Float ) {



    } //update

} //Player
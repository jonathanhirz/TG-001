package entity;

import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import component.Controls;

class Player extends Sprite {

    public var acceleration : Vector = new Vector(0, 0);
    var velocity : Vector = new Vector(0, 0);
    var decel : Float = 0.8;

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

        velocity.add(acceleration);
        pos.add(velocity);
        velocity.multiply(new Vector(decel, decel));
        if(Math.abs(velocity.x) < 0.01) velocity.x = 0;
        if(Math.abs(velocity.y) < 0.01) velocity.y = 0;

    } //update

} //Player
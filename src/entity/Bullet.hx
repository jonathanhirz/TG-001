package entity;

import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

class Bullet extends Sprite {

    /*
    collider
    bounds arounds screen (destroy when off screen)
    movement
    oncollision, react
    */
    
    public var velocity : Vector = new Vector(0, 0);

    public function new() {

        super({
            name : 'bullet',
            name_unique : false,
            size : new Vector(8, 8),
            color : new Color().rgb(0x37ff21),
            visible : false
        });

    } //new

    override function update( dt:Float ) {



    } //update
 
} //Bullet
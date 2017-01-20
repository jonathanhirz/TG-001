package component;

import luxe.Component;
import luxe.Vector;
import luxe.Sprite;
import luxe.Color;
import luxe.structural.Pool;

import entity.Bullet;

class Gun extends Component {

    /*
    create pool of bullet sprites
    handle 'fire' state
    */

    var bullet_pool : Pool<Bullet>;

    override function onadded() {

        bullet_pool = new Pool<Bullet>(20, function() {
            return new Bullet();
        });

    } //onadded

    override function init() {


    } //init

    override function update( dt:Float ) {


    } //update

} //Gun
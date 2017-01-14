package entity;

import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.collision.Collision;
import luxe.collision.shapes.Circle;
import luxe.collision.ShapeDrawerLuxe;

import component.Controls;

class Player extends Sprite {

    public var acceleration : Vector = new Vector(0, 0);
    var velocity : Vector = new Vector(0, 0);
    var decel : Float = 0.8;

    var player_collider : Circle;
    var player_collider_drawer : ShapeDrawerLuxe;

    public function new() {

        super({
            name : 'player',
            pos : new Vector(100, 100),
            size : new Vector(32, 32),
            color : new Color().rgb(0x7d8eff)
        });
        add(new Controls());
        player_collider = new Circle(pos.x, pos.y, size.x / 2);
        player_collider_drawer = new ShapeDrawerLuxe();

    } //new

    override function update( dt:Float ) {

        pos.set_xy(player_collider.x, player_collider.y);
        velocity.add(acceleration);
        player_collider.position.add(velocity);
        velocity.multiply(new Vector(decel, decel));
        if(Math.abs(velocity.x) < 0.01) velocity.x = 0;
        if(Math.abs(velocity.y) < 0.01) velocity.y = 0;

        resolve_collisions();

        if(Main.draw_colliders) {
            player_collider_drawer.drawCircle(player_collider);
        }

    } //update

    function resolve_collisions() {

        var collisions = Collision.shapeWithShapes(player_collider, Main.tilemap_colliders);
        for(collision in collisions) {
            player_collider.position.add(new Vector(collision.separationX, collision.separationY));
        }

    } //resolve_collisions

} //Player
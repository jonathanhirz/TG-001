package entity;

import states.*;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.tilemaps.Tilemap;
import luxe.importers.tiled.*;
import luxe.collision.shapes.Circle;
import luxe.collision.ShapeDrawerLuxe;
import slappy.Bass;

import component.Controls;
import component.Gun;

class Player extends Sprite {

    public var acceleration : Vector = new Vector(0, 0);
    var velocity : Vector = new Vector(0, 0);
    var decel : Vector = new Vector(0.8, 0.8);

    var player_collider : Circle;
    var player_collider_drawer : ShapeDrawerLuxe;

    var current_map : TiledMap;

    public function new() {

        super({
            name : 'player',
            pos : new Vector(100, 100),
            size : new Vector(32, 32),
            color : new Color().rgb(0x7d8eff)
        });
        add(new Controls());
        add(new Gun());

        player_collider = new Circle(pos.x, pos.y, size.x / 2);
        player_collider_drawer = new ShapeDrawerLuxe();

        current_map = GameState.map_01;

    } //new

    override function update( dt:Float ) {

        pos.set_xy(player_collider.x, player_collider.y);
        velocity.add(acceleration);
        player_collider.position.add(velocity);
        velocity.multiply(decel);
        if(Math.abs(velocity.x) < 0.01) velocity.x = 0;
        if(Math.abs(velocity.y) < 0.01) velocity.y = 0;

        if(Main.draw_colliders) {
            player_collider_drawer.drawCircle(player_collider);
        }

    } //update

} //Player
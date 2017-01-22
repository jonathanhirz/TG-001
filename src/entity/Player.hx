package entity;

import states.*;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.tilemaps.Tilemap;
import luxe.importers.tiled.*;
import luxe.collision.Collision;
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

        velocity.add(acceleration);
        player_collider.position.add(velocity);

        resolve_horizontal_collisions();
        resolve_vertical_collisions();

        pos.set_xy(player_collider.position.x, player_collider.position.y);
        velocity.multiply(decel);
        if(Math.abs(velocity.x) < 0.01) velocity.x = 0;
        if(Math.abs(velocity.y) < 0.01) velocity.y = 0;

        

        if(Main.draw_colliders) {
            player_collider_drawer.drawCircle(player_collider);
        }

    } //update

    function resolve_horizontal_collisions() {

        var collisions = Collision.shapeWithShapes(player_collider, Main.tilemap_colliders);
        if(collisions.length == 1) {
            player_collider.position.x += collisions.get(0).separationX;
        }
        if(collisions.length > 1) {
            if(Math.abs(collisions.get(0).separationX) > Math.abs(collisions.get(1).separationX)) {
                player_collider.position.x += collisions.get(0).separationX;
            }
            if(Math.abs(collisions.get(1).separationX) > Math.abs(collisions.get(0).separationX)) {
                player_collider.position.x += collisions.get(1).separationX;
            }
        }

    } //resolve_horizontal_collisions

    function resolve_vertical_collisions() {

        var collisions = Collision.shapeWithShapes(player_collider, Main.tilemap_colliders);
        if(collisions.length == 1) {
            player_collider.position.y += collisions.get(0).separationY;
        }
        if(collisions.length > 1) {
            if(Math.abs(collisions.get(0).separationY) > Math.abs(collisions.get(1).separationY)) {
                player_collider.position.y += collisions.get(0).separationY;
            }
            if(Math.abs(collisions.get(1).separationY) > Math.abs(collisions.get(0).separationY)) {
                player_collider.position.y += collisions.get(1).separationY;
            }
        }

    } //resolve_vertical_collisions

} //Player
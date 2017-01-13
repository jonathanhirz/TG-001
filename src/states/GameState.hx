package states;

import luxe.Log.*;
import luxe.States;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import luxe.tilemaps.Tilemap;
import luxe.importers.tiled.*;

import entity.*;

class GameState extends State {

    var player : Player;
    var map_01 : TiledMap;
    var map_scale : Int = 1;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {


    } //init

    override function onenter<T>( _value:T ) {

        create_tilemap();
        player = new Player();

    } //onenter

    override function onleave<T>( _value:T ) {

        // player.destroy();


    } //onleave

    override function update( dt:Float ) {

        Luxe.camera.center.weighted_average_xy(player.pos.x, player.pos.y, 5);

    } //update

    function create_tilemap() {

        // load tilemap
        var res = Luxe.resources.text('assets/map_01.tmx');
        assertnull(res, 'Tilemap not found');
        map_01 = new TiledMap({
            tiled_file_data : res.asset.text,
            format : 'tmx',
            pos : new Vector(0, 0)
        });
        map_01.display({ depth : -1 });
    
    } //create_tilemap

} //GameState
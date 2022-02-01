package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import Paths;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.system.FlxSound;

using StringTools;
/**
 * For when you want to show that something is happening, but you don't know how to use FlxBar as a progress bar.
 * 
 * @param x Float. Sets X position of the spinner. Defaults to `FlxG.width - 48`
 * @param y Float. Sets Y position of the spinner. Defaults to `FlxG.width - 48`
 */
class FunnySpin extends FlxSprite {
    
    override public function new(?x:Float = 1232, ?y:Float = 672) {
        super();
        frames = Paths.getSparrowAtlas('speen');
        animation.addByPrefix('spin', 'spinner go brr', 30, true);
    }

    function create() {
        animation.play('spin');
    }

    override function update(elapsed:Float) {
        if (this != null) {
            this.update(elapsed);
        }
    }
}
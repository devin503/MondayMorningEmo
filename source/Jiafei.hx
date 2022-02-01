package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import Character;

using StringTools;

typedef CvmProduct = {
    var animations:Array<CashGrab>;
	var image:String;
	var scale:Float;
	var sing_duration:Float;
	var healthicon:String;

	var position:Array<Float>;
	var camera_position:Array<Float>;

	var flip_x:Bool;
	var no_antialiasing:Bool;
	var healthColors:Array<Int>;
    var fname:String;
}

typedef CashGrab = {
	var anim:String;
	var name:String;
	var fps:Int;
	var loop:Bool;
	var indices:Array<Int>;
	var offsets:Array<Int>;
}
/**
 * Dumb bitch can't decide character? 😡😡😡🥴🥴🥴😃😃😃
 * 
 * Use this sexy jiafei cvm product to instantly cure dumb bitch syndrome! 😍😍😍🍷🍷🍷✝️✝️✝️
 */
class Jiafei extends Character {

    public function new(x:Float, y:Float, ?char:String = 'bf')
        {
            super(x, y, char, true);
            trace(animOffsets);
        }
    
        public function kidnap() {
            trace('I am coming to kidnap you ❤️❤️');
            /* if (animOffsets.exists('kidnap')) {
                playAnim('kidnap');
            } else if (animOffsets.exists('hey')) {
                playAnim('hey');
            } else {
                playAnim('singUP');
            } */ //backup
            checkAndPlayHey();
        }
        
        private inline function checkAndPlayHey() {
                if (animOffsetList.exists('kidnap')) {
                    playAnim('kidnap');
                    // break;
                } else if (animOffsetList.exists('hey')) {
                    playAnim('hey');
                    // break;
                } else if (animOffsetList.exists('singUP')) {
                    playAnim('singUP');
                    // break;
                } else {
                    // continue;
                }
            }

        
        override function update(elapsed:Float)
        {
            if (!debugMode)
            {
                if (animation.curAnim.name.startsWith('sing'))
                {
                    holdTimer += elapsed;
                }
                else
                    holdTimer = 0;
    
                if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
                {
                    playAnim('idle', true, false, 10);
                }
    
                if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished)
                {
                    playAnim('deathLoop');
                }
            }
    
            super.update(elapsed);
        }

        public function switchTo(char:String) {
            trace('switching char');
            destroy();
            new Jiafei(this.x, this.y, char);
        }

	var animOffsetList:Map<String, Array<Dynamic>> = super.animOffsets;

	

	public function getFname(arg0:String):String {
		throw new haxe.exceptions.NotImplementedException('sus');
	}
}
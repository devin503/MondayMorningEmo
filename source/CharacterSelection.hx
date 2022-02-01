package;

import flixel.util.FlxColor;
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.text.FlxText;
// import Amogus;
import Jiafei;
import FunnySpin;
import Character;
import PlayState;
import Song.SwagSong as SussySong;
import Alphabet;
import HealthIcon;

using StringTools;
/**
 * Character selection state. Opens after selecting a song in Freeplay.
 * 
 * Custom character support will be added in the future, and any characters you create will also appear here.
 */
class CharacterSelection extends MusicBeatState {
    /**
     * Lists any *playable* characters available in the game. Defaults to:
     * `['bf', 'bf-car', 'bf-christmas', 'bf-pixel']`
     * 
     * **Custom characters are currently __NOT__ supported!**
     */
    var charList:Array<String> = ['bf', 'bf-car', 'bf-christmas', 'bf-pixel'];
    var charDirectory = 'assets/characters';
    var jiafei:Jiafei;
    var brockenBg:FlxSprite;
    var ass:SussySong;
    var charName:FlxText;
    var charIcon:HealthIcon;
    var product:CvmProduct;
    /**
     * Character ID value. This corresponds to `charList`'s entries.
     * 
     * Example: bf = 0
     */
    var charId:Int = 0;

    public function new(?crazy:Any) {
        super();

        brockenBg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        brockenBg.scrollFactor.x = 0;
		brockenBg.scrollFactor.y = 0.17;
		brockenBg.setGraphicSize(Std.int(brockenBg.width * 1.2));
		brockenBg.updateHitbox();
		brockenBg.screenCenter();
        add(brockenBg);
        jiafei = new Jiafei(0, FlxG.height - 450, 'bf');
        if (crazy != null) {
            jiafei.destroy();
            jiafei = new Jiafei(0, FlxG.height - 300, crazy);
        }
        jiafei.screenCenter(X);
        // product = cast Json.parse(jiafei.jsonFile);
        add(jiafei);
        charName = new FlxText(0, FlxG.height - 700, FlxG.width, 'Boyfriend.xml', 24);
        charName.setFormat(Paths.font('vcr.ttf'), 24, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(charName);
    }

    override function update (elapsed:Float) {
        if (charName != null && product != null && charName.text != product.fname) {
            charName.text = product.fname;
        }

        if (controls.LEFT) {
            changeJiafei(-1);
        }

        if (controls.RIGHT) {
            changeJiafei(1);
        }
    }

    function changeJiafei(change:Int = 0) {
        charId += change;

        if (charId < 0) {
            charId = charList.length;
        } else if (charId > charList.length) {
            charId = 0;
        }

        jiafei.switchTo(charList[charId]);
    }
}
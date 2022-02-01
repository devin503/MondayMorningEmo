package character;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;
import sys.io.File;
import flixel.system.debug.interaction.tools.Pointer.GraphicCursorCross;
import sys.FileSystem;

using StringTools;

class BaseCharacterState extends MusicBeatState {
    public function new() {
        super();
        trace('wip');
        new FlxTimer().start(3, function (tmr:FlxTimer) {
            returnToPrevState();
        });
    }

    private function returnToPrevState() {
        LoadingState.loadAndSwitchState(new MainMenuState(), false);
    }
}
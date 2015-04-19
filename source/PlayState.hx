package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		var spr:FlxSprite = new FlxSprite();
		spr.loadGraphic(AssetPaths.keyboard__png);
		spr.origin.set(0, 0);
		spr.scale.set(2, 2);
		add(spr);
		
		add(new DanceBattleGame());
		
		add(new Fist());
		
		FlxG.camera.pixelPerfectRender = false;
		
		var spr = new FlxSprite();
		spr.makeGraphic(32, 32, 0x01);
		//FlxSpriteUtil.drawCircle(spr, -1, -1, -1, 0x44ffffff);
		
		//FlxG.mouse.load(spr.pixels);
	}
}

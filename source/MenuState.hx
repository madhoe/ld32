package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	private var text:FlxText;
	private var help:FlxText;
	private var count:Int = 0;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		text = new FlxText(0, 0, 320, "KEYS", 24);
		add(text);
		
		help = new FlxText(0, 240 - 12, 320, "ANY KEY TO START", 8);
		help.alignment = "right";
		add(help);
		
		FlxG.mouse.unload();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		
		text = help = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ANY)
		{
			if (count == 0)
			{
				FlxG.camera.shake(0.01, 0.1);
				text.text += "\nTHE BOARD";
				help.text = "ANY KEY TO START!";
			}
			if (count == 1)
			{
				FlxG.camera.shake(0.015, 0.11);
				text.text += "\nTHE DANCE";
				help.text = "PRESS ANY KEY TO START!!";
			}
			if (count == 2)
			{
				FlxG.camera.shake(0.02, 0.12);
				text.text += "\nTHE BATTLE";
				help.text = "I SAID PRESS ANY KEY TO START!!!";
			}
			if (count == 3)
			{
				FlxG.camera.shake(0.025, 0.13);
				text.text += "\nTHE GAME";
				help.text = "SMASH THE FUCKING KEYBOARD!!!!";
			}
			if (count == 4)
			{
				FlxG.switchState(new PlayState());
				return;
			}
				
			FlxG.sound.play(AssetPaths.smash__wav);
			count++;
		}
	}
}
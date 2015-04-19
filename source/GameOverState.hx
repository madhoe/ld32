package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
 */
class GameOverState extends FlxState
{

	override public function create():Void 
	{
		super.create();
		
		var text:FlxText = new FlxText(0, 120 - 12, 320, "RIP KEYBOARD :\"(", 24);
		text.alignment = "center";
		add(text);
		
		text = new FlxText(0, 240 - 12, 320, "made by @maddhoe in 6.5 hrs :(", 8);
		text.alignment = "right";
		add(text);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ANY)
			FlxG.switchState(new MenuState());
	}
	
}
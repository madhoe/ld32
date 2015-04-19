package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
 */
class Fist extends FlxSprite
{

	public function new() 
	{
		super();
		
		loadGraphic(AssetPaths.fist__png, true, 32, 32);
		animation.add("smash", [1, 1, 1, 1, 0], 16, false);
		
		origin.set(0, 0);
		scale.set(4, 4);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (animation.frameIndex == 1)
			return;
		
		var mousePos = FlxG.mouse.getWorldPosition();
		
		flipX = mousePos.x < 160;
		
		x = mousePos.x - (flipX ? 26 : 4) * 4;
		y = mousePos.y - 16 * 4;
		
		if (y < 240 - 32 * 4)
			y = 240 - 32 * 4;
			
		if (FlxG.mouse.justPressed)
		{
			FlxG.camera.shake(0.025, 0.15);
			animation.play("smash");
		}
	}
	
}
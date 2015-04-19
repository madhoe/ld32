package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
 */
class LoadingBar extends FlxSprite
{

	private var time:Float = 0;
	private var onFinish:Void->Void;
	
	public function new(cx:Float, cy:Float, onFinish:Void->Void) 
	{
		super(cx - 64, cy - 2);
		
		makeGraphic(128, 4);
		
		origin.set(0, 8);
		scale.x = 0;
		
		this.onFinish = onFinish;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		time += elapsed * FlxG.random.float(0, 2);
		
		scale.x = Math.min(time, 2) / 2;
		
		if (time >= 2)
		{
			onFinish();
		}
	}
	
}
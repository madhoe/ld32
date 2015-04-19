package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import openfl.Assets;

/**
 * ...
 * @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
 */
class Dancer extends FlxSpriteGroup
{
	
	private var adjectives:Array<String>;
	private var nouns:Array<String>;
	
	private var text:FlxText;
	
	private var count:Int = 0;
	
	public function new(x:Float, y:Float) 
	{
		super();
		
		this.x = x;
		this.y = y;
		
		add(new FlxSprite(25, 0, AssetPaths.head__png));
		add(new FlxSprite(10, 21, AssetPaths.lefthand__png));
		add(new FlxSprite(38, 22, AssetPaths.righthand__png));
		add(new FlxSprite(25, 21, AssetPaths.body__png));
		add(new FlxSprite(26, 42, AssetPaths.leftleg__png));
		add(new FlxSprite(32, 42, AssetPaths.rightleg__png));
		add(text = new FlxText( -4, -8));
		
		var str:String = Assets.getText(AssetPaths.adjectives__txt);
		adjectives = str.split("\r\n");
		str = Assets.getText(AssetPaths.nouns__txt);
		nouns = str.split("\r\n");
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		
		text = null;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.mouse.justPressed)
		{
			count++;
			
			for (spr in this)
			{
				if (spr == text)
					continue;
				
				if (FlxG.random.bool())
					spr.angularVelocity = FlxG.random.float(-90, 90);
				else
					spr.angularVelocity = 0;
					
				if (count == 1)
					text.text = "SUPER!";
				else if (count == 2)
					text.text = "CRAZY COMBO MY FRIEND";
				else if (count == 3)
					text.text = "WAAAOOOOWWWWW";
				else if (count == 4)
					text.text = "MAGNIFICENT MAGIKARP!";
				else
				{	
					var str = adjectives[FlxG.random.int(0, adjectives.length)] + " " +
						nouns[FlxG.random.int(0, nouns.length)];
					text.text = str.toUpperCase() + "!";
				}
			}
		}
	}
	
}
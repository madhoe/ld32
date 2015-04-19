package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

/**
 * ...
 * @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
 */
class DanceBattleGame extends FlxSpriteGroup
{
	
	private static inline var WIDTH:Int = 160;
	private static inline var HEIGHT:Int = 90;
	
	private var state:String = "loading";
	
	private var count:Int = 0;
	private var scoreText:FlxText;
	private var score:Int;
	
	public function new() 
	{
		super();
		
		x = 80;
		y = 24;
		
		add(new LoadingBar(80, 45, function() {
			start("menu");
			remove(members[0], true).destroy();
		}));
	}
	
	private function start(state:String)
	{
		this.state = state;
		
		switch (state)
		{
			case "menu":
				var start = new FlxText(0, HEIGHT / 2, WIDTH, "DANCE BATTLE\nANY KEY TO START", 8);
				start.y -= 8;
				start.alignment = "center";
				add(start);
			case "game":
				var bg:FlxSprite = new FlxSprite();
				bg.makeGraphic(WIDTH, HEIGHT, 0xff222244);
				add(bg);
				bg = new FlxSprite(0, HEIGHT - 32);
				bg.makeGraphic(WIDTH, 32, 0xff7788bb);
				add(bg);
				add(new Dancer(16, 16));
				
				scoreText = new FlxText(0, HEIGHT - 12, WIDTH, "0");
				scoreText.alignment = "right";
				score = 0;
				add(scoreText);
		}
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		
		scoreText = null;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		switch (state)
		{
			case "menu":
				if (FlxG.mouse.justPressed)
				{
					start("game");
					remove(members[0], true).destroy();
				}
			case "game":
				if (FlxG.mouse.justPressed)
				{
					count++;
					if (count >= 15)
						FlxG.switchState(new GameOverState());
						
					score += FlxG.random.int(1000, 1000000);
					scoreText.text = Std.string(score);
				}
		}
	}
	
}
package edu.usc.interactive  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author David Elliott
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = 'data/walkCycle.png')] private var WalkCycle:Class;
		public var runSpeed:int = 90;
		public var accelerationSpeed:int = runSpeed * 8;
		public function Player(X:int, Y:int) 
		{
			super(X, Y);
			
			//basic player physics
			drag.x = runSpeed*8;
			drag.y = runSpeed*8;
			maxVelocity.x = runSpeed;
			maxVelocity.y = runSpeed;

			loadGraphic(WalkCycle, true, true, 27, 50);
			addAnimation("runForward", [0, 1, 2, 3], 11, true);
			addAnimation("runBackward", [4, 5, 6, 7], 11, true);
			addAnimation("idle", [0]);
		}
		
		override public function update():void 
		{

			acceleration.y = 0;
			acceleration.x = 0;
			//MOVEMENT
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
			{
				facing = LEFT;
				acceleration.x = -accelerationSpeed;
				acceleration.y = -accelerationSpeed;
			}
			else if(FlxG.keys.UP)
			{
				facing = RIGHT;
				acceleration.x = accelerationSpeed;
				acceleration.y = -accelerationSpeed;
			}
			else if (FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x = accelerationSpeed;
				acceleration.y = accelerationSpeed;
			}
			else if (FlxG.keys.DOWN)
			{
				facing = LEFT;
				acceleration.x = -accelerationSpeed;
				acceleration.y = accelerationSpeed;
			}
			
			//ANIMATION
			if (velocity.y == 0)
			{
				play("idle");
			}
			else if (velocity.y > 0)
			{
				play("runForward");
			}
			else
			{
				play("runBackward");
			}
			
			//Screen boundary
			if (x < 0 || x > FlxG.width || y < 0 || y > FlxG.height)
			{
				x = FlxG.width / 2;
				y = FlxG.height/2;
			}
			
			super.update();
		}
		
	}

}
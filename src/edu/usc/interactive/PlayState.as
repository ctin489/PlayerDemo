package edu.usc.interactive
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		protected var _player:Player;

		override public function create():void
		{
			FlxState.bgColor = 0xffffff;
			_player = new Player(50, 50);
			add(_player);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}

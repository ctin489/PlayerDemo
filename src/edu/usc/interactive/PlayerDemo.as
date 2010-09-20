package edu.usc.interactive
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#ffffff")]
	[Frame(factoryClass="edu.usc.interactive.Preloader")]

	public class PlayerDemo extends FlxGame
	{
		public function PlayerDemo()
		{
			super(640,480,MenuState,1);
		}
	}
}

package hmycl;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.system.Capabilities;
import flash.Lib;
import openfl.Assets;


class Main extends Sprite {
	
	private var Background:Bitmap;	
	
	public function new () {
		
		super ();
		
		load();
		initialization();
		
	}
	
	private function load ():Void {
		
		Background = new Bitmap(Assets.getBitmapData("images/background.png"));
		
	}
	
	private function initialization ():Void	{
		
		addChild(Background);
		
	}
	

}
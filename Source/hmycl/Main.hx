package hmycl;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.system.Capabilities;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;


class Main extends Sprite {
	
	private var background:Bitmap;	
	private var askScreen:AskScreen;
	//private var countScreen:CountScreen;
	
	public function new () {
		
		super ();
		
		load ();
		initialization ();
		
	}
	
	private function load ():Void {
		
		background = new Bitmap (Assets.getBitmapData ("images/background.png"));
		askScreen = new AskScreen (this.askScreenFinish);
		
	}
	
	private function initialization ():Void	{
		
		addChild(background);
		addChild(askScreen);
		
	}
	
	private function askScreenFinish ():Void {
		//this.removeChild(askScreen);
	}
}
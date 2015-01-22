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
	private var countScreen:CountScreen;
	private var resultScreen:ResultScreen;
	
	public function new () {
		
		super ();
		
		load ();
		initialization ();
		
	}
	
	private function load ():Void {
		
		background = new Bitmap (Assets.getBitmapData ("images/background.png"));
		askScreen = new AskScreen (askScreenFinish);
		countScreen = new CountScreen (countScreenFinish);
		
	}
	
	private function initialization ():Void	{
		
		addChild(background);
		// addChild(askScreen);
		addChild(countScreen);
	}
	
	private function askScreenFinish (heigt, weight):Void {
		
		removeChild(askScreen);
		addChild(countScreen);
		
	}
	
	private function countScreenFinish ():Void {
		
		removeChild(countScreen);
		// addChild(resultScreen);
		
	}
}
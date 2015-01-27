package hmycl;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

class CountScreen extends Sprite {
	
	private var background:DrunkBackground;
	private var formuls:Formuls;
	private var callbackEnd:Dynamic;
	
	public function new(callbackEnd:Dynamic) {
		
		super ();
		
		this.callbackEnd = callbackEnd;
		
		load ();
		initialization ();
		
	}
	
	private function load ():Void {
		
		background = new DrunkBackground();
		background.texture = Assets.getBitmapData ("images/triangle.png");		
		
	}
	
	private function initialization ():Void {
		
		background.cols = 8;
		background.rows = 12;
		background.x = -50;
		background.y = -50;		
		background.setSize (800 + 100, 650 + 100);
		
		formuls = new Formuls(callbackEnd);
		
		addChild (background);
		addChild (formuls);
		
	}
	
}
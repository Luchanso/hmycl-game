package hmycl;


import openfl.display.Bitmap;
import openfl.geom.Point;

class Formula {
	
	public var alpha:Float;
	public var position:Point;
	public var rotation:Float;	
	public var scale:Float;
	public var speedX:Float;
	public var speedY:Float;
	public var texture:Bitmap;
	
	public function new(texture:Bitmap)
	{
		this.texture = texture;		
		
		speedX = 0;
		speedY = 0;
	}
	
}
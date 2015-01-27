package hmycl;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.filters.BitmapFilter;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;


/**
 * ...
 * @author Loutchansky Oleg
 */
class Icon
{
	private var img:Bitmap;	
	private var textField:TextField;	
	private var nameIcon:String;
	private var screen:Sprite;
	
	public var isVisible(get, set):Bool;	
	public var text(get, set):String;
	public var x (default, default):Int;
	public var y (default, default):Int;
	
	function get_isVisible():Bool 
	{
		return img.visible;
	}
	
	function set_isVisible(value:Bool):Bool 
	{
		textField.visible = value;
		img.visible = value;
		return value;
	}
	
	function get_text():String 
	{
		return textField.text;
	}
	
	function set_text(value:String):String 
	{
		return textField.text = value;
	}
	
	public function new (screen:Sprite, name:String, text:String = "", visible = true, x:Int = 0, y:Int = 0)
	{	
		
		this.screen = screen;
		this.nameIcon = name;
		
		this.x = x;
		this.y = y;		
		
		ini ();
		
		this.text = text;
		
		if (visible) {
			this.isVisible = true;
		}
		
	}
	
	public function dispose ():Void {
		
		screen.removeChild (textField);
		screen.removeChild (img);
		
	}
	
	public function hide ():Void {
		
		textField.visible = false;
		img.visible = false;
		
	}
	
	public function show ():Void {
		
		textField.visible = true;
		img.visible = true;
		
	}
	
	private function ini ():Void {	
		
		img = new Bitmap (Assets.getBitmapData ("images/icons/" + nameIcon + ".png"));
		img.x = this.x + 18;
		img.y = this.y;
		
		var textFormat = new TextFormat ("Arial", 12, 0xFFFFFF);
		textFormat.align = TextFormatAlign.CENTER;
		var shadow = new DropShadowFilter (2, 90, 0, 0.7, 3, 3);		
		
		textField = new TextField();
		textField.selectable = false;
		//textField.autoSize = TextFieldAutoSize.CENTER;
		textField.defaultTextFormat = textFormat;
		textField.width = 100;
		textField.wordWrap = true;
		
		textField.x = this.x;
		textField.y = this.y + 72;
		textField.filters = [shadow];
		img.filters = [shadow];
		
		if (this.isVisible) {
			screen.addChild (img);
			screen.addChild (textField);
		}
		
	}
	
}
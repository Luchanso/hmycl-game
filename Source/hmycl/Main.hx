package hmycl;


import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.SimpleButton;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.system.Capabilities;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
#if flash
import flash.net.FileReference;
#end
import openfl.utils.ByteArray;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;
import openfl.geom.Rectangle;
import openfl.utils.Object;
#if flash
import vk.api.Client;
import vk.events.CustomEvent;
import vk.Vk;
#end

class Main extends Sprite {
	
	private var background:Bitmap;	
	private var askScreen:AskScreen;
	private var countScreen:CountScreen;
	private var resultScreen:ResultScreen;
	private var count:Float;
	private var c = 300000;
	#if flash
	private var vk:Vk;
	private var btnvk:SimpleButton;
	private var textLoad:TextField;
	private var textLoadComplete:TextField;
	#end
	
	public function new () {
		
		super ();		
		
		#if flash
		var flashVars = this.stage.loaderInfo.parameters;
		
		if (flashVars.api_id != null)
		{
			this.vk = new Vk(flashVars);
			
			var paramsWindow = new Array();
			paramsWindow.push("setTitle");
			paramsWindow.push("Сколько стоит твоя жизнь?");
			
			vk.callMethod(paramsWindow);
		}
		#end
		
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
		addChild(askScreen);
		
	}
	
	#if flash
	
	private function complete (params:Dynamic):Void {
		
		trace(params);
		params = Json.parse(params);	
		
		params = {
			"photo": params.photo,
			"server": params.server,
			"hash": params.hash,			
		}
		trace(params);
		
		vk.api("photos.saveWallPhoto", params, publicOnWall, error);		
		
	}
	
	private function publicOnWall (params:Dynamic):Void {
		trace(params);
		var wallPostParams = {			
			"message": "А сколько стоит твоя жизнь?",
			"attachments": getPhotoID(Std.string(params)) + ",https://vk.com/app4743301"
		}
		trace(wallPostParams);
		vk.api("wall.post", wallPostParams, endLoadPhoto, error);
	}
	
	private function getPhotoID (str:String):String {
			var start = str.indexOf(" id : ") + " id : ".length;
			var end = str.indexOf(" ", start);
			var temp = str.substring(start, end);
			if (temp.indexOf(",") != -1)
				temp = temp.substring(0, temp.length - 1);
			return temp;
	}
		
	
	private function endLoadPhoto (params:Dynamic):Void {
		textLoad.text = "Запись опубликована";
	}
	
	private function error (params:Dynamic):Void {
		trace(params);
		
		removeChild(textLoad);
		addChild(btnvk);
	}
	
	private function startLoad(_):Void {
		removeChild(btnvk);		
		
		var test = new BitmapData(Math.round(this.stage.width), Math.round(this.stage.height));
		test.draw(this);
		
		var temp = new TextFormat("Arial", 30, 0xFFFFFF);
		textLoad = new TextField();
		textLoad.defaultTextFormat = temp;
		textLoad.x = 350;
		textLoad.y = 600;
		textLoad.autoSize = TextFieldAutoSize.CENTER;
		textLoad.text = "Подождите пару секунд, загружаю картинку...";
		
		addChild(textLoad);
		
		var byteArray:ByteArray = test.encode ( new Rectangle(0, 0, test.width, test.height), new PNGEncoderOptions(false));
		
		if (vk != null)
		{						
			vk.uploadWallPhoto(byteArray, {  }, complete, error);			
		}		
	}
	#end
	
	private function askScreenFinish (heigt, weight):Void {
		
		removeChild(askScreen);
		addChild(countScreen);
		
		this.count = (((height * c * c) * 1 / 3600) / 1000) * 4.312341325 * (weight % 100 + 100);
	}
	
	private function countScreenFinish ():Void {
		
		removeChild(countScreen);
		resultScreen = new ResultScreen(this.count);
		addChild(resultScreen);
		
		#if flash
		var btn = new Bitmap(Assets.getBitmapData("images/vkbtn.png"));
		var btnhover = new Bitmap(Assets.getBitmapData("images/vkbtnhover.png"));
		
		
		btnvk = new SimpleButton(btn, btnhover, btnhover, btn);
		btnvk.x = 320;
		btnvk.y = 600;
		btnvk.addEventListener(MouseEvent.CLICK, startLoad);
		
		addChild(btnvk);
		#end
	}
}
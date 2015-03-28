package hmycl;


import haxe.Json;
import haxe.macro.Compiler;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Loader;
import openfl.display.SimpleButton;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.system.ApplicationDomain;
import openfl.system.Capabilities;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.system.LoaderContext;
import openfl.system.Security;
import openfl.system.SecurityDomain;
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
//import com.vk.MainVKBanner;
//import com.vk.MainVKBannerEvent;
//import com.vk.vo.BannersPanelVO;
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
	
	private static inline var adUnitId = "50847";
	
	private var mainVKBanner: Dynamic;
	private var loader : Loader;
	private var flashVars : Dynamic;
	#end
	
	public function new () {
		
		super ();
		
		#if flash

		flashVars = this.stage.loaderInfo.parameters;
		
		loader = new Loader();
		var context = new LoaderContext(false, ApplicationDomain.currentDomain);
		context.securityDomain = SecurityDomain.currentDomain;
		loader.load(new URLRequest('//api.vk.com/swf/vk_ads.swf'), context);
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_onLoadComplete);	
		
		if (flashVars.api_id != null)
		{
			this.vk = new Vk(flashVars);
			
			var paramsWindow = new Array();
			paramsWindow.push("setTitle");
			paramsWindow.push("Сколько стоит твоя жизнь?");
			
			vk.callMethod(paramsWindow);
			Settings.vk = vk;
		}
		#end
		
		load ();
		initialization ();
		
	}
	
	private function test(e:Event):Void 
	{
		trace(e);
	}
	
	private function loader_onLoadComplete(e:Event):Void 
	{
		trace('Loader complete');
		mainVKBanner = new com.vk.MainVKBanner(Settings.ADS_BOTTOM);
		
		trace('mainVKBanner created');
		
		var params = new com.vk.vo.BannersPanelVO(); // создание класса параметров баннера
		// изменение стандартных параметров:
		params.demo = Settings.ADS_TEST; // показывает тестовые баннеры
		
		// вертикальный (AD_TYPE_VERTICAL) или горизонтальный (AD_TYPE_HORIZONTAL) блок баннеров
		params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_HORIZONTAL; 
		params.ad_height = 0;
		params.ad_width = 800;
		// Вертикальный (AD_UNIT_TYPE_VERTICAL) или горизонтальный (AD_UNIT_TYPE_HORIZONTAL) баннер внутри блока баннеров
		params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_VERTICAL;		
		params.ads_count = Settings.ADS_BOTTOM_COUNT;
		
		trace('Adding listeners');
		
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_COMPLETE, banner_onLoad);
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_IS_EMPTY, banner_onAdsEmpty);
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_ERROR, banner_onError);
		
		mainVKBanner.initBanner(flashVars, params);

		
		//addChild(mainVKBanner);
		mainVKBanner.x = 0;
		mainVKBanner.y = 650;
		addChild(mainVKBanner);
		trace('Added listeners');
	}
	
	private function banner_onError(e:Event):Void 
	{
		trace('error');
	}
	
	private function banner_onAdsEmpty(e:Event):Void 
	{
		trace('onAdsEmpry');
	}
	
	private function banner_onLoad(e:Event):Void 
	{
		trace('Complete Ads');
	}
	
	private function load ():Void {
		
		background = new Bitmap (Assets.getBitmapData ("images/background.png"));
		askScreen = new AskScreen (askScreenFinish);
		countScreen = new CountScreen (countScreenFinish, startLoad);		
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
		//removeChild(btnvk);
		
		var test = new BitmapData(Math.round(this.stage.width), Math.round(this.stage.height));		
		test.draw(background);
		test.draw(resultScreen);
		
		var byteArray:ByteArray = test.encode ( new Rectangle(0, 0, test.width, test.height), new PNGEncoderOptions(false));
		
		if (vk != null)
		{
			vk.uploadWallPhoto(byteArray, {  }, complete, error);		
		}		
	}
	#end
	
	private function askScreenFinish (heigt, weight):Void {
		
		removeChild(askScreen);
		addChildAt(countScreen, 1);
		countScreen.ads_init(flashVars);
		
		this.count = (((height * c * c) * 1 / 3600) / 1000) * 4.312341325 * (weight % 100 + 100);
		
		resultScreen = new ResultScreen(this.count);
	}
	
	private function countScreenFinish ():Void {
		
		removeChild(countScreen);
		addChild(resultScreen);
		
		#if flash
		var btn = new Bitmap(Assets.getBitmapData("images/vkbtn.png"));
		var btnhover = new Bitmap(Assets.getBitmapData("images/vkbtnhover.png"));
		
		btnvk = new SimpleButton(btn, btnhover, btnhover, btn);
		btnvk.x = 320;
		btnvk.y = 600;
		/*btnvk.addEventListener(MouseEvent.CLICK, startLoad);*/
		
		addChild(btnvk);
		#end
	}
}
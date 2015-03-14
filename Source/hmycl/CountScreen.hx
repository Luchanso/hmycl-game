package hmycl;

import openfl.display.Bitmap;
import openfl.display.SimpleButton;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.net.URLRequest;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

class CountScreen extends Sprite {
	
	private var background:DrunkBackground;
	private var formuls:Formuls;
	private var callbackEnd:Void -> Void;
	private var uploadResult:Dynamic;
	
	static inline var timeout1 = 3000;
	static inline var timeout2 = 2000;
	
	var timer : Int = 0;
	var step : Int = 0;
	
	public function new(callbackEnd:Void -> Void, uploadResult : Dynamic) {
		
		super ();
		
		this.callbackEnd = callbackEnd;
		this.uploadResult = uploadResult;
		
		load ();
		initialization ();
		
	}
	
	public function ads_init(flashVars) {
		var mainVKBanner = new com.vk.MainVKBanner(Settings.ADS_TOP);
		
		var params = new com.vk.vo.BannersPanelVO(); // создание класса параметров баннера
		// изменение стандартных параметров:
		params.demo = Settings.ADS_TEST; // показывает тестовые баннеры
		
		// вертикальный (AD_TYPE_VERTICAL) или горизонтальный (AD_TYPE_HORIZONTAL) блок баннеров
		params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_HORIZONTAL; 
		params.ad_height = 155;
		params.ad_width = 240;
		// Вертикальный (AD_UNIT_TYPE_VERTICAL) или горизонтальный (AD_UNIT_TYPE_HORIZONTAL) баннер внутри блока баннеров
		params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_VERTICAL;		
		params.ads_count = Settings.ADS_TOP_COUNT;
		
		trace('Adding listeners');
		
		mainVKBanner.initBanner(flashVars, params);
		
		//addChild(mainVKBanner);
		mainVKBanner.x = Lib.current.stage.width / 2 - params.ad_width / 2 - 52;
		mainVKBanner.y = 115;
		addChild(mainVKBanner);
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
		
		formuls = new Formuls(formulsCallbackEnd);
		
		addChild (background);
		addChild (formuls);
		
	}
	
	function formulsCallbackEnd() 
	{
		var additionalInfo = new TextField();
		var format = new TextFormat("Arial", 25, 0xFFFA2D, true);
		format.align = TextFormatAlign.CENTER;
		
		additionalInfo = new TextField();
		additionalInfo.defaultTextFormat = format;
		additionalInfo.autoSize = TextFieldAutoSize.CENTER;
		additionalInfo.text = "Подпишись, чтобы узнать результат!";
		additionalInfo.selectable = false;
		
		additionalInfo.x = 800 / 2 - additionalInfo.width / 2;
		additionalInfo.y = 470;
		
		var btn = new Bitmap(Assets.getBitmapData("images/vkbtnpub.png"));
		var btnhover = new Bitmap(Assets.getBitmapData("images/vkbtnpubhover.png"));
		
		var btnvk = new SimpleButton(btn, btnhover, btnhover, btn);
		btnvk.x =  800 / 2 - btnvk.width / 2;
		btnvk.y = 520;
		btnvk.addEventListener(MouseEvent.CLICK, publicEvent);
		
		addChild(additionalInfo);
		addChild(btnvk);
		trace("Finish");
		
		timer = Lib.getTimer();		
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function publicEvent(e:MouseEvent):Void
	{
		Lib.getURL(new URLRequest(Settings.PUBLIC_URL), "_blank");
	}
	
	private function update(e:Event):Void
	{
		if (step == 0)
		{
			if (Lib.getTimer() - timer > timeout1)
			{
				step++;
				
				this.uploadResult(null);
				
				timer = Lib.getTimer();
			}
		}
		else if (step == 1)
		{
			if (Lib.getTimer() - timer > timeout2)
			{
				removeEventListener(Event.ENTER_FRAME, update);
				this.callbackEnd();
				step++;
			}
		}
	}
}
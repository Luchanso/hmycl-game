package hmycl;


import haxe.Int64;
import openfl.display.Sprite;
import openfl.errors.Error;
import openfl.events.Event;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
#if flash
import flash.globalization.NumberFormatter;
#end

class ResultScreen extends Sprite {
	
	private var labelCount:TextField;
	private var labelInfo:TextField;
	private var labelInfo2:TextField;
	private var count:Float;
	
	public function new(count:Float) {
		
		super ();
		
		this.count = count;
		initialization ();
	}
	
	public function initialization ():Void {
		
		var textFormat = new TextFormat("Arial", 16, 0xFFFFFF);
		var textFormat2 = new TextFormat("Arial", 32, 0xFFFFFF);
		
		textFormat.align = TextFormatAlign.LEFT;
		
		var shadow = new DropShadowFilter(2, 90, 0, 0.7, 8, 8);		
		
		var numberFormatter = new NumberFormatter("ru_RU");		
		
		
		labelInfo = new TextField();		
		labelInfo.filters = [shadow];
		labelInfo.defaultTextFormat = textFormat2;
		labelInfo.text = "По подсчётам русских учёных моя жизнь стоит";
		labelInfo.x = 40;	
		labelInfo.y = 25;
		labelInfo.autoSize = TextFieldAutoSize.LEFT;
		labelInfo.selectable = false;
		
		labelInfo2 = new TextField();
		
		labelInfo2.filters = [shadow];
		labelInfo2.defaultTextFormat = textFormat2;
		labelInfo2.text = "На эти деньги можно купить";
		labelInfo2.width = 700;
		labelInfo2.x = 50;
		labelInfo2.y = 125;
		labelInfo2.autoSize = TextFieldAutoSize.CENTER;
		labelInfo2.selectable = false;
				
		labelCount = new TextField();
		labelCount.filters = [shadow];
		labelCount.defaultTextFormat = textFormat2;
		labelCount.x = 50;
		labelCount.y = 75;		
		labelCount.width = 700;
		labelCount.text = numberFormatter.formatNumber(count) + " руб.";
		labelCount.autoSize = TextFieldAutoSize.CENTER;
		labelCount.selectable = false;
		
		addIconInfo();
		
		addChild(labelInfo);
		addChild(labelInfo2);
		addChild(labelCount);
		
	}	
	
	private function addIconInfo():Void {
		
		var numberFormatter = new NumberFormatter("ru_RU");
		numberFormatter.fractionalDigits = 0;
		
		var cBear = (count / 89);		
		var cBurger = (count / 49);
		var cChainsaw = (count / 6000);
		var cClosed = (count / 25000);
		var cCoffee = (count / 94);
		var cCar = (count / 7063000);
		var cFlower = (count / 101);
		var cJoystick = (count / 8999);
		var cpicturetaking = (count / 80230); 
		var cpizza = (count / 203);
		var cring = (count / 8932);
		var rocket = (count / 2561960000);
		var sea = (count / 120000312);
		var cross = (count / 2423);
		var smartphone = (count / 46000);
		var smoking = (count / 654);
		var ginza = (count / 5000);
		var fuel = (count / 33);
		
		if (cBear > cBurger) {
			throw new Error("Bear > Burger");
		}
		
		var margin = 50;
		var size = 100;
		
		var block1Pos = 175;
		var block2Pos = 325;
		var block3Pos = 475;
		
		var iBear = new Icon(this, "beer1",  numberFormatter.formatNumber(cBear) + " " + numerals(cBear, "Кружка", "Кружки", "Кружек") + " пива", true, margin * 2, block1Pos);		
		var iBurger = new Icon(this, "burger15",  numberFormatter.formatNumber(cBurger) + " " + numerals(cBurger, "Чизбургер", "Чизбургера", "Чизбургеров"), true, margin * 2 + size * 1, block1Pos);
		var iChainsaw = new Icon(this, "chainsaw3",  numberFormatter.formatNumber(cChainsaw) + " " + numerals(cChainsaw, "Бензопила", "Бензопилы", "Бензопил"), true, margin * 2 + size * 2, block1Pos);
		var iClosed = new Icon(this, "closed37",  numberFormatter.formatNumber(cClosed) + " " + numerals(cClosed, "Пару", "Пары", "Пар") + " ботильон", true, margin * 2 + size * 3, block1Pos);
		var iCoffee = new Icon(this, "coffee119",  numberFormatter.formatNumber(cCoffee * 125/1000) + " " + numerals(cCoffee * 125/1000, "Литр", "Литра", "Литров") + " капучино", true, margin * 2 + size * 4, block1Pos);
		var iCar = new Icon(this, "convertible2",  numberFormatter.formatNumber(cCar) + " " + numerals(cCar, "Спорткар", "Спорткара", "Спорткаров"), true, margin * 2 + size * 5, block1Pos);
		
		var iFlower = new Icon(this, "flower165",  numberFormatter.formatNumber(cFlower) + " " + numerals(cFlower, "Розу", "Розы", "Роз"), true, margin * 2, block2Pos);		
		var iJoystick = new Icon(this, "joystick10",  numberFormatter.formatNumber(cJoystick) + " " + numerals(cJoystick, "Игровая приставка", "Игровые приставки", "Пять приставок") + "", true, margin * 2 + size * 1, block2Pos);
		var iPicturetaking = new Icon(this, "picturetaking",  numberFormatter.formatNumber(cpicturetaking) + " " + numerals(cpicturetaking, "Зеркалка", "Зералки", "Зеркалок"), true, margin * 2 + size * 2, block2Pos);
		var iPizza = new Icon(this, "pizza",  numberFormatter.formatNumber(cpizza) + " " + numerals(cpizza, "Пиццу", "Пиццы", "Пицц"), true, margin * 2 + size * 3, block2Pos);
		var iRing = new Icon(this, "ring28",  numberFormatter.formatNumber(cring) + " " + numerals(cring, "Свадебное кольцо", "Свадебных кольца", "Свадебных колец"), true, margin * 2 + size * 4, block2Pos);
		var iRocke = new Icon(this, "rocket74",  numberFormatter.formatNumber(rocket) + " " + numerals(rocket, "Полёт в космос", "Полёта в космос", "Полётов в космос"), true, margin * 2 + size * 5, block2Pos);
		
		var iSea = new Icon(this, "sea8",  numberFormatter.formatNumber(sea) + " " + numerals(sea, "Яхту", "Яхты", "Яхт"), true, margin * 2, block3Pos);		
		var iCross = new Icon(this, "shoes13",  numberFormatter.formatNumber(cross) + " " + numerals(cross, "Пару кроссовок", "Пары кроссовок", "Пары кроссовок"), true, margin * 2 + size * 1, block3Pos);		
		var iSmartphone = new Icon(this, "smartphone24",  numberFormatter.formatNumber(smartphone) + " " + numerals(smartphone, "Смартфон", "Смартфона", "Смартфонов"), true, margin * 2 + size * 2, block3Pos);		
		var iSmoking = new Icon(this, "smoking4",  numberFormatter.formatNumber(smoking) + " " + numerals(smoking, "Блок", "Блока", "Блоков") + " сигарет", true, margin * 2 + size * 3, block3Pos);		
		var iGinza = new Icon(this, "restaurant",  numberFormatter.formatNumber(ginza) + " " + numerals(ginza, "Поход", "Похода", "Походов") + " в ресторан", true, margin * 2 + size * 4, block3Pos);		
		var iFuel = new Icon(this, "fuel14",  numberFormatter.formatNumber(fuel) + " " + numerals(fuel, "Литр", "Литра", "Литров") + " 95 бензина ", true, margin * 2 + size * 5, block3Pos);		
				
	}
	
	private function numerals (n:Float, form1:String, form2:String, form5:String):String {
		
		n = Math.round(Math.abs(n)) % 100;
		var n1 = n % 10;
		
		if (n > 10 && n < 20) return form5;
		if (n1 > 1 && n1 < 5) return form2;
		if (n1 == 1) return form1;
		
		return form5;
	}

}

#if !flash
class NumberFormatter
{
	public var fractionalDigits:Int;
	public function new(arg)
	{
		
	}
	
	public function formatNumber(number:Float):String {		
		var str = Std.string(Math.fround(number));
		var i = str.length;
		while (i > 0) {
			i -= 3;
			str = str.substring(0, i) + " " + str.substring(i, str.length);
		}
		
		return str;
	}
}
#end
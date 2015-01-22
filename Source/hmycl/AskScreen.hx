package hmycl;


import haxe.Constraints.Function;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.SimpleButton;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.filters.BlurFilter;
import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.geom.Point;
import openfl.media.Sound;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Lib;
import openfl.Assets;


class AskScreen extends Sprite
{

	private var inputTextWeight:TextField;
	private var inputTextHeight:TextField;
	private var labelWeight:TextField;
	private var labelWeightUnits:TextField;
	private var labelHeight:TextField;
	private var labelHeightUnits:TextField;
	private var errorLabel:TextField;
	
	private var buttonEnter:SimpleButton;
	
	private var callback:Dynamic;

	public function new (callback:Dynamic) {
		
		super ();
		
		this.callback = callback;
		initialization ();
		
	}
	
	private function initialization ():Void {
		
		//{ region Labels and Inputs
		// Смещения
		var offsetX = 260;
		var offsetY = 100;
		
		var marginTop = 0;
		
		var font = Assets.getFont("fonts/RussoOne.ttf").fontName;
		var labelFormat = new TextFormat("Arial", 35, 0xFFFFFF);
		var shadow = new DropShadowFilter(2, 90, 0, 0.7, 8, 8);		
		
		labelWeight = new TextField();
		labelWeight.defaultTextFormat = labelFormat;	
		labelWeight.text = "Укажите свой вес: ";
		labelWeight.width = labelWeight.textWidth + 10;
		labelWeight.height = labelWeight.textHeight + 10;
		labelWeight.x = offsetX;
		labelWeight.y = offsetY;
		labelWeight.filters = [shadow];
		labelWeight.selectable = false;
		
		var inputFormat = new TextFormat("Arial", 35, 0x212121);
		inputFormat.align = TextFormatAlign.CENTER;
		
		inputTextWeight = new TextField ();
		inputTextWeight.x = offsetX;
		inputTextWeight.y = labelWeight.y + labelWeight.height;
		inputTextWeight.width = 215;
		inputTextWeight.height = 40;
		inputTextWeight.multiline = false;
		inputTextWeight.background = true;
		inputTextWeight.type = TextFieldType.INPUT;
		inputTextWeight.defaultTextFormat = inputFormat;
		inputTextWeight.restrict = "0-9";
		
		labelWeightUnits = new TextField ();
		labelWeightUnits.defaultTextFormat = labelFormat;
		labelWeightUnits.text = "кг.";
		labelWeightUnits.width = labelWeightUnits.textWidth + 10;
		labelWeightUnits.x = inputTextWeight.x + inputTextWeight.width + 25;
		labelWeightUnits.y = inputTextWeight.y;		
		labelWeightUnits.filters = [shadow];		
		
		labelHeight = new TextField();
		labelHeight.defaultTextFormat = labelFormat;	
		labelHeight.text = "И свой рост: ";
		labelHeight.width = labelHeight.textWidth + 10;
		labelHeight.height = labelHeight.textHeight + 10;
		labelHeight.x = offsetX;
		labelHeight.y = inputTextWeight.y + inputTextWeight.height + offsetY;
		labelHeight.filters = [shadow];
		labelHeight.selectable = false;
		
		inputTextHeight = new TextField ();
		inputTextHeight.x = offsetX;
		inputTextHeight.y = labelHeight.y + labelHeight.height;
		inputTextHeight.width = 215;
		inputTextHeight.height = 40;
		inputTextHeight.multiline = false;
		inputTextHeight.background = true;
		inputTextHeight.type = TextFieldType.INPUT;
		inputTextHeight.defaultTextFormat = inputFormat;
		inputTextHeight.restrict = "0-9";
		
		labelHeightUnits = new TextField ();
		labelHeightUnits.defaultTextFormat = labelFormat;
		labelHeightUnits.text = "см.";
		labelHeightUnits.width = labelHeightUnits.textWidth + 10;
		labelHeightUnits.x = inputTextHeight.x + inputTextHeight.width + 25;
		labelHeightUnits.y = inputTextHeight.y;		
		labelHeightUnits.filters = [shadow];
		
		addChild(labelWeight);
		addChild(labelWeightUnits);
		addChild(inputTextWeight);
		
		addChild(labelHeight);
		addChild(labelHeightUnits);
		addChild(inputTextHeight);
		//} endregion
		
		//{ region button
		
		var bmpButtonPress = new Bitmap (Assets.getBitmapData ("images/buttonNextPress.png"));
		var bmpButtonHover = new Bitmap (Assets.getBitmapData ("images/buttonNextHover.png"));
		var bmpButtonUp = new Bitmap (Assets.getBitmapData ("images/buttonNextUp.png"));
		
		buttonEnter = new SimpleButton (bmpButtonUp, bmpButtonHover, bmpButtonPress, bmpButtonUp);
		buttonEnter.x = offsetX;
		buttonEnter.y = inputTextHeight.height + inputTextHeight.y + 50;
		buttonEnter.filters = [shadow];
		buttonEnter.addEventListener (MouseEvent.CLICK, buttonEnterPress);
		
		addChild (buttonEnter);
		
		//} endregion
		
		var errorFormat = new TextFormat("Arial", 16, 0xFF6464, true);		
		
		errorLabel = new TextField();
		errorLabel.defaultTextFormat = errorFormat;
		errorLabel.text = "Ошибка";
		errorLabel.x = offsetX + 100;
		errorLabel.y = inputTextWeight.y + inputTextWeight.height + 35;
		errorLabel.visible = true;		
		errorLabel.filters = [shadow];
		errorLabel.autoSize = TextFieldAutoSize.CENTER;
		errorLabel.selectable = false;
		errorLabel.visible = false;
		
		addChild (errorLabel);
	}
	
	private function buttonEnterPress (e:Event):Void {
		
		if (this.inputTextHeight.text == "" || this.inputTextWeight.text == "") {
			
			errorLabel.visible = true;
			errorLabel.text = "Все поля должны быть заполнены";
			return;
			
		}
		
		var height = Std.parseInt (this.inputTextHeight.text);
		var weight = Std.parseInt (this.inputTextWeight.text);
		
		if (height < 30 || height > 275) {
			
			erorrHeight ();
			return;
			
		}
		if (weight < 2 || weight > 750) {
			
			erorrWeight ();			
			return;
			
		}
		
		this.callback(height, weight);
		
	}

	private function erorrHeight ():Void {
		
		errorLabel.visible = true;
		errorLabel.text = "Неправильно указан рост - он должен быть в пределах от 30 до 275 см.";
		
	}
	
	private function erorrWeight ():Void {
		
		errorLabel.visible = true;
		errorLabel.text = "Неправильно указан вес - он должен быть в пределах от 2 до 750 кг.";
		
	}
}
package hmycl;


import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Matrix;
import openfl.geom.Point;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

class Formuls extends Sprite {
	
	var formuls:Array <Formula>;
	var bitmaps:Array <BitmapData>;
	var count = 100;
	var status:TextField;
	var progress:Float;
	var callback:Dynamic;

	public function new (callback:Dynamic) {
		
		super ();
		
		this.callback = callback;
		
		load ();
		initialization ();
		
	}
	
	private function load ():Void {
		
		formuls = new Array <Formula> ();
		bitmaps = new Array <BitmapData> ();
		var countBitmaps = 16;
		
		for (i in 1...countBitmaps) {
			
			bitmaps.push (Assets.getBitmapData ("images/formuls/formula (" + i + ").png"));
			
		}
	}
	
	private function initialization ():Void {
		
		var format = new TextFormat("Arial", 50, 0xFFFA2D, true);
		format.align = TextFormatAlign.CENTER;
		
		status = new TextField();
		status.defaultTextFormat = format;
		status.autoSize = TextFieldAutoSize.CENTER;
		status.text = "Производятся расчёты: 0%";
		status.selectable = false;
		
		status.x = 400 - status.textWidth / 2;
		status.y = 325 - status.textHeight / 2;
		
		progress = 0;
		
		addChild(status);
		
		addEventListener (Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function  onAddedToStage (e:Event):Void {
		
		addEventListener (Event.ENTER_FRAME, onEnterFrame);
		
	}
	
	private function onEnterFrame (e:Event):Void {
		
		progress++;
		status.text = "Производятся расчёты: " + Math.round(progress/2) + "%";
		if (progress > 200) {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			status.text = "Расчёты выполнены!";			
			this.callback();
		}
		
		if (formuls.length < 80) {
				
			var formula = CreateFormula ();
			if (formula == null)
				return;
			formuls.push (formula);
			
			addChild (formula.texture);

		}
		
		for (i in 0...formuls.length) {
			
			if (formuls[i] == null)
				continue;
			
			CalculateFormula (i);
			
			if (!CheckFormula (i)) {
				
				DeleteFormula (i);
				
			}			
			
		}
		
	}
	
	private function CheckFormula (i:Int):Bool {		
		
		if (formuls[i].position.x > 800 + 250 ||
			formuls[i].position.y > 650 + 250 ||
			formuls[i].position.x < -250 ||
			formuls[i].position.y < -250) {
					
				return false;
				
		}
		else {
			
			return true;
			
		}	
		
	}
	
	private function DeleteFormula (i:Int):Void {
		
		removeChild (formuls[i].texture);
		formuls.remove (formuls[i]);
		
	}
	
	private function CreateFormula ():Formula {
		
		if (stage == null)
			return null;
		
		var formula = new Formula( new Bitmap(bitmaps[Std.random (bitmaps.length - 1)]));
		formula.alpha = 0.1 + Math.random () * 0.6;
		formula.position = new Point (10 + Std.random (Math.round(stage.width)), 10 + Std.random (Math.round(stage.height)));
		formula.scale = 0.0 + Math.random () * 0.6;
		formula.speedX = -20 + Math.random () * 40;
		formula.speedY = -20 + Math.random () * 40;
		formula.rotation = -15 + Math.random () * 30;		
		
		formula.texture.x = formula.position.x;
		formula.texture.y = formula.position.y;
		formula.texture.rotation = formula.rotation;
		formula.texture.scaleX = formula.scale;
		formula.texture.scaleY = formula.scale;
		formula.texture.alpha = formula.alpha;
		
		return formula;
		
	}
	
	private function CalculateFormula (i:Int):Void {
			
		var formula = formuls[i];
		formula.position.x += formula.speedX;
		formula.position.y += formula.speedY;
		
		formula.texture.x = formula.position.x;
		formula.texture.y = formula.position.y;
		// formula.texture.rotation += formula.rotation;
		
	}
	
}
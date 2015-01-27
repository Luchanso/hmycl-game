import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new NMEPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("Russo One");
		types.push (AssetType.FONT);
		
		
		urls.push ("images/background.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/buttonNextHover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/buttonNextPress.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/buttonNextUp.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (1).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (10).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (11).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (12).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (13).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (14).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (15).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (2).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (3).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (4).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (5).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (6).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (7).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (8).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/formuls/formula (9).png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/beer1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/burger15.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/business56.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/chainsaw3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/closed37.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/coffee119.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/convertible2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/flower165.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/fuel14.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/joystick10.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/picturetaking.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/pizza.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/restaurant.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/ring28.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/ring5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/rocket74.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/sea8.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/shoes13.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/smartphone24.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/smoking4.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/icons/wine56.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/triangle.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/vkbtn.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("images/vkbtnhover.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("styles/labels.css");
		types.push (AssetType.TEXT);
		
		
		urls.push ("styles/labels.min.css");
		types.push (AssetType.TEXT);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (16777215),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (40),
			fullscreen: false,
			height: Std.int (650),
			orientation: "",
			resizable: true,
			stencilBuffer: false,
			title: "Сколько стоит твоя жизнь?",
			vsync: false,
			width: Std.int (800),
			
		}
		
		#if js
		#if (munit || utest)
		flash.Lib.embed (null, 800, 650, "FFFFFF");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (hmycl.Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (hmycl.Main, Reflect.field (hmycl.Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends hmycl.Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end

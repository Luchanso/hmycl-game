package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("fonts/RussoOne.ttf", __ASSET__fonts_russoone_ttf);
		type.set ("fonts/RussoOne.ttf", AssetType.FONT);
		className.set ("images/background.png", __ASSET__images_background_png);
		type.set ("images/background.png", AssetType.IMAGE);
		className.set ("images/buttonNextHover.png", __ASSET__images_buttonnexthover_png);
		type.set ("images/buttonNextHover.png", AssetType.IMAGE);
		className.set ("images/buttonNextPress.png", __ASSET__images_buttonnextpress_png);
		type.set ("images/buttonNextPress.png", AssetType.IMAGE);
		className.set ("images/buttonNextUp.png", __ASSET__images_buttonnextup_png);
		type.set ("images/buttonNextUp.png", AssetType.IMAGE);
		className.set ("images/formuls/formula (1).png", __ASSET__images_formuls_formula__1__png);
		type.set ("images/formuls/formula (1).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (10).png", __ASSET__images_formuls_formula__10__png);
		type.set ("images/formuls/formula (10).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (11).png", __ASSET__images_formuls_formula__11__png);
		type.set ("images/formuls/formula (11).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (12).png", __ASSET__images_formuls_formula__12__png);
		type.set ("images/formuls/formula (12).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (13).png", __ASSET__images_formuls_formula__13__png);
		type.set ("images/formuls/formula (13).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (14).png", __ASSET__images_formuls_formula__14__png);
		type.set ("images/formuls/formula (14).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (15).png", __ASSET__images_formuls_formula__15__png);
		type.set ("images/formuls/formula (15).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (2).png", __ASSET__images_formuls_formula__2__png);
		type.set ("images/formuls/formula (2).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (3).png", __ASSET__images_formuls_formula__3__png);
		type.set ("images/formuls/formula (3).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (4).png", __ASSET__images_formuls_formula__4__png);
		type.set ("images/formuls/formula (4).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (5).png", __ASSET__images_formuls_formula__5__png);
		type.set ("images/formuls/formula (5).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (6).png", __ASSET__images_formuls_formula__6__png);
		type.set ("images/formuls/formula (6).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (7).png", __ASSET__images_formuls_formula__7__png);
		type.set ("images/formuls/formula (7).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (8).png", __ASSET__images_formuls_formula__8__png);
		type.set ("images/formuls/formula (8).png", AssetType.IMAGE);
		className.set ("images/formuls/formula (9).png", __ASSET__images_formuls_formula__9__png);
		type.set ("images/formuls/formula (9).png", AssetType.IMAGE);
		className.set ("images/icons/beer1.png", __ASSET__images_icons_beer1_png);
		type.set ("images/icons/beer1.png", AssetType.IMAGE);
		className.set ("images/icons/burger15.png", __ASSET__images_icons_burger15_png);
		type.set ("images/icons/burger15.png", AssetType.IMAGE);
		className.set ("images/icons/business56.png", __ASSET__images_icons_business56_png);
		type.set ("images/icons/business56.png", AssetType.IMAGE);
		className.set ("images/icons/chainsaw3.png", __ASSET__images_icons_chainsaw3_png);
		type.set ("images/icons/chainsaw3.png", AssetType.IMAGE);
		className.set ("images/icons/closed37.png", __ASSET__images_icons_closed37_png);
		type.set ("images/icons/closed37.png", AssetType.IMAGE);
		className.set ("images/icons/coffee119.png", __ASSET__images_icons_coffee119_png);
		type.set ("images/icons/coffee119.png", AssetType.IMAGE);
		className.set ("images/icons/convertible2.png", __ASSET__images_icons_convertible2_png);
		type.set ("images/icons/convertible2.png", AssetType.IMAGE);
		className.set ("images/icons/flower165.png", __ASSET__images_icons_flower165_png);
		type.set ("images/icons/flower165.png", AssetType.IMAGE);
		className.set ("images/icons/fuel14.png", __ASSET__images_icons_fuel14_png);
		type.set ("images/icons/fuel14.png", AssetType.IMAGE);
		className.set ("images/icons/joystick10.png", __ASSET__images_icons_joystick10_png);
		type.set ("images/icons/joystick10.png", AssetType.IMAGE);
		className.set ("images/icons/picturetaking.png", __ASSET__images_icons_picturetaking_png);
		type.set ("images/icons/picturetaking.png", AssetType.IMAGE);
		className.set ("images/icons/pizza.png", __ASSET__images_icons_pizza_png);
		type.set ("images/icons/pizza.png", AssetType.IMAGE);
		className.set ("images/icons/restaurant.png", __ASSET__images_icons_restaurant_png);
		type.set ("images/icons/restaurant.png", AssetType.IMAGE);
		className.set ("images/icons/ring28.png", __ASSET__images_icons_ring28_png);
		type.set ("images/icons/ring28.png", AssetType.IMAGE);
		className.set ("images/icons/ring5.png", __ASSET__images_icons_ring5_png);
		type.set ("images/icons/ring5.png", AssetType.IMAGE);
		className.set ("images/icons/rocket74.png", __ASSET__images_icons_rocket74_png);
		type.set ("images/icons/rocket74.png", AssetType.IMAGE);
		className.set ("images/icons/sea8.png", __ASSET__images_icons_sea8_png);
		type.set ("images/icons/sea8.png", AssetType.IMAGE);
		className.set ("images/icons/shoes13.png", __ASSET__images_icons_shoes13_png);
		type.set ("images/icons/shoes13.png", AssetType.IMAGE);
		className.set ("images/icons/smartphone24.png", __ASSET__images_icons_smartphone24_png);
		type.set ("images/icons/smartphone24.png", AssetType.IMAGE);
		className.set ("images/icons/smoking4.png", __ASSET__images_icons_smoking4_png);
		type.set ("images/icons/smoking4.png", AssetType.IMAGE);
		className.set ("images/icons/wine56.png", __ASSET__images_icons_wine56_png);
		type.set ("images/icons/wine56.png", AssetType.IMAGE);
		className.set ("images/triangle.png", __ASSET__images_triangle_png);
		type.set ("images/triangle.png", AssetType.IMAGE);
		className.set ("images/vkbtn.png", __ASSET__images_vkbtn_png);
		type.set ("images/vkbtn.png", AssetType.IMAGE);
		className.set ("images/vkbtnhover.png", __ASSET__images_vkbtnhover_png);
		type.set ("images/vkbtnhover.png", AssetType.IMAGE);
		className.set ("styles/labels.css", __ASSET__styles_labels_css);
		type.set ("styles/labels.css", AssetType.TEXT);
		className.set ("styles/labels.min.css", __ASSET__styles_labels_min_css);
		type.set ("styles/labels.min.css", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "fonts/RussoOne.ttf";
		className.set (id, __ASSET__fonts_russoone_ttf);
		
		type.set (id, AssetType.FONT);
		id = "images/background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/buttonNextHover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/buttonNextPress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/buttonNextUp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (1).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (10).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (11).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (12).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (13).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (14).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (15).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (2).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (3).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (4).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (5).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (6).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (7).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (8).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/formuls/formula (9).png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/beer1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/burger15.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/business56.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/chainsaw3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/closed37.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/coffee119.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/convertible2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/flower165.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/fuel14.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/joystick10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/picturetaking.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/pizza.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/restaurant.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/ring28.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/ring5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/rocket74.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/sea8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/shoes13.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/smartphone24.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/smoking4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/icons/wine56.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/triangle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/vkbtn.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "images/vkbtnhover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/labels.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/labels.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		#else
		
		#if openfl
		
		openfl.text.Font.registerFont (__ASSET__fonts_russoone_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("fonts/RussoOne.ttf", __ASSET__fonts_russoone_ttf);
		type.set ("fonts/RussoOne.ttf", AssetType.FONT);
		
		className.set ("images/background.png", __ASSET__images_background_png);
		type.set ("images/background.png", AssetType.IMAGE);
		
		className.set ("images/buttonNextHover.png", __ASSET__images_buttonnexthover_png);
		type.set ("images/buttonNextHover.png", AssetType.IMAGE);
		
		className.set ("images/buttonNextPress.png", __ASSET__images_buttonnextpress_png);
		type.set ("images/buttonNextPress.png", AssetType.IMAGE);
		
		className.set ("images/buttonNextUp.png", __ASSET__images_buttonnextup_png);
		type.set ("images/buttonNextUp.png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (1).png", __ASSET__images_formuls_formula__1__png);
		type.set ("images/formuls/formula (1).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (10).png", __ASSET__images_formuls_formula__10__png);
		type.set ("images/formuls/formula (10).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (11).png", __ASSET__images_formuls_formula__11__png);
		type.set ("images/formuls/formula (11).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (12).png", __ASSET__images_formuls_formula__12__png);
		type.set ("images/formuls/formula (12).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (13).png", __ASSET__images_formuls_formula__13__png);
		type.set ("images/formuls/formula (13).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (14).png", __ASSET__images_formuls_formula__14__png);
		type.set ("images/formuls/formula (14).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (15).png", __ASSET__images_formuls_formula__15__png);
		type.set ("images/formuls/formula (15).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (2).png", __ASSET__images_formuls_formula__2__png);
		type.set ("images/formuls/formula (2).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (3).png", __ASSET__images_formuls_formula__3__png);
		type.set ("images/formuls/formula (3).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (4).png", __ASSET__images_formuls_formula__4__png);
		type.set ("images/formuls/formula (4).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (5).png", __ASSET__images_formuls_formula__5__png);
		type.set ("images/formuls/formula (5).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (6).png", __ASSET__images_formuls_formula__6__png);
		type.set ("images/formuls/formula (6).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (7).png", __ASSET__images_formuls_formula__7__png);
		type.set ("images/formuls/formula (7).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (8).png", __ASSET__images_formuls_formula__8__png);
		type.set ("images/formuls/formula (8).png", AssetType.IMAGE);
		
		className.set ("images/formuls/formula (9).png", __ASSET__images_formuls_formula__9__png);
		type.set ("images/formuls/formula (9).png", AssetType.IMAGE);
		
		className.set ("images/icons/beer1.png", __ASSET__images_icons_beer1_png);
		type.set ("images/icons/beer1.png", AssetType.IMAGE);
		
		className.set ("images/icons/burger15.png", __ASSET__images_icons_burger15_png);
		type.set ("images/icons/burger15.png", AssetType.IMAGE);
		
		className.set ("images/icons/business56.png", __ASSET__images_icons_business56_png);
		type.set ("images/icons/business56.png", AssetType.IMAGE);
		
		className.set ("images/icons/chainsaw3.png", __ASSET__images_icons_chainsaw3_png);
		type.set ("images/icons/chainsaw3.png", AssetType.IMAGE);
		
		className.set ("images/icons/closed37.png", __ASSET__images_icons_closed37_png);
		type.set ("images/icons/closed37.png", AssetType.IMAGE);
		
		className.set ("images/icons/coffee119.png", __ASSET__images_icons_coffee119_png);
		type.set ("images/icons/coffee119.png", AssetType.IMAGE);
		
		className.set ("images/icons/convertible2.png", __ASSET__images_icons_convertible2_png);
		type.set ("images/icons/convertible2.png", AssetType.IMAGE);
		
		className.set ("images/icons/flower165.png", __ASSET__images_icons_flower165_png);
		type.set ("images/icons/flower165.png", AssetType.IMAGE);
		
		className.set ("images/icons/fuel14.png", __ASSET__images_icons_fuel14_png);
		type.set ("images/icons/fuel14.png", AssetType.IMAGE);
		
		className.set ("images/icons/joystick10.png", __ASSET__images_icons_joystick10_png);
		type.set ("images/icons/joystick10.png", AssetType.IMAGE);
		
		className.set ("images/icons/picturetaking.png", __ASSET__images_icons_picturetaking_png);
		type.set ("images/icons/picturetaking.png", AssetType.IMAGE);
		
		className.set ("images/icons/pizza.png", __ASSET__images_icons_pizza_png);
		type.set ("images/icons/pizza.png", AssetType.IMAGE);
		
		className.set ("images/icons/restaurant.png", __ASSET__images_icons_restaurant_png);
		type.set ("images/icons/restaurant.png", AssetType.IMAGE);
		
		className.set ("images/icons/ring28.png", __ASSET__images_icons_ring28_png);
		type.set ("images/icons/ring28.png", AssetType.IMAGE);
		
		className.set ("images/icons/ring5.png", __ASSET__images_icons_ring5_png);
		type.set ("images/icons/ring5.png", AssetType.IMAGE);
		
		className.set ("images/icons/rocket74.png", __ASSET__images_icons_rocket74_png);
		type.set ("images/icons/rocket74.png", AssetType.IMAGE);
		
		className.set ("images/icons/sea8.png", __ASSET__images_icons_sea8_png);
		type.set ("images/icons/sea8.png", AssetType.IMAGE);
		
		className.set ("images/icons/shoes13.png", __ASSET__images_icons_shoes13_png);
		type.set ("images/icons/shoes13.png", AssetType.IMAGE);
		
		className.set ("images/icons/smartphone24.png", __ASSET__images_icons_smartphone24_png);
		type.set ("images/icons/smartphone24.png", AssetType.IMAGE);
		
		className.set ("images/icons/smoking4.png", __ASSET__images_icons_smoking4_png);
		type.set ("images/icons/smoking4.png", AssetType.IMAGE);
		
		className.set ("images/icons/wine56.png", __ASSET__images_icons_wine56_png);
		type.set ("images/icons/wine56.png", AssetType.IMAGE);
		
		className.set ("images/triangle.png", __ASSET__images_triangle_png);
		type.set ("images/triangle.png", AssetType.IMAGE);
		
		className.set ("images/vkbtn.png", __ASSET__images_vkbtn_png);
		type.set ("images/vkbtn.png", AssetType.IMAGE);
		
		className.set ("images/vkbtnhover.png", __ASSET__images_vkbtnhover_png);
		type.set ("images/vkbtnhover.png", AssetType.IMAGE);
		
		className.set ("styles/labels.css", __ASSET__styles_labels_css);
		type.set ("styles/labels.css", AssetType.TEXT);
		
		className.set ("styles/labels.min.css", __ASSET__styles_labels_min_css);
		type.set ("styles/labels.min.css", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__fonts_russoone_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__images_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_buttonnexthover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_buttonnextpress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_buttonnextup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__1__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__10__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__11__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__12__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__13__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__14__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__15__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__2__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__3__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__4__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__5__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__6__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__7__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__8__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_formuls_formula__9__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_beer1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_burger15_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_business56_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_chainsaw3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_closed37_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_coffee119_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_convertible2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_flower165_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_fuel14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_joystick10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_picturetaking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_pizza_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_restaurant_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_ring28_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_ring5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_rocket74_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_sea8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_shoes13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_smartphone24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_smoking4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_icons_wine56_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_triangle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_vkbtn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__images_vkbtnhover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_labels_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_labels_min_css extends flash.utils.ByteArray { }


#elseif html5

#if openfl
@:keep #if display private #end class __ASSET__fonts_russoone_ttf extends openfl.text.Font { public function new () { super (); fontName = "Russo One"; } } 














































#end

#else

#if openfl
@:keep class __ASSET__fonts_russoone_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "fonts/RussoOne.ttf"; fontName = "Russo One"; }}

#end

#if (windows || mac || linux)


@:font("Assets/fonts/RussoOne.ttf") class __ASSET__fonts_russoone_ttf extends lime.graphics.Font {}
@:bitmap("Assets/images/background.png") class __ASSET__images_background_png extends lime.graphics.Image {}
@:bitmap("Assets/images/buttonNextHover.png") class __ASSET__images_buttonnexthover_png extends lime.graphics.Image {}
@:bitmap("Assets/images/buttonNextPress.png") class __ASSET__images_buttonnextpress_png extends lime.graphics.Image {}
@:bitmap("Assets/images/buttonNextUp.png") class __ASSET__images_buttonnextup_png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (1).png") class __ASSET__images_formuls_formula__1__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (10).png") class __ASSET__images_formuls_formula__10__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (11).png") class __ASSET__images_formuls_formula__11__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (12).png") class __ASSET__images_formuls_formula__12__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (13).png") class __ASSET__images_formuls_formula__13__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (14).png") class __ASSET__images_formuls_formula__14__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (15).png") class __ASSET__images_formuls_formula__15__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (2).png") class __ASSET__images_formuls_formula__2__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (3).png") class __ASSET__images_formuls_formula__3__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (4).png") class __ASSET__images_formuls_formula__4__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (5).png") class __ASSET__images_formuls_formula__5__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (6).png") class __ASSET__images_formuls_formula__6__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (7).png") class __ASSET__images_formuls_formula__7__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (8).png") class __ASSET__images_formuls_formula__8__png extends lime.graphics.Image {}
@:bitmap("Assets/images/formuls/formula (9).png") class __ASSET__images_formuls_formula__9__png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/beer1.png") class __ASSET__images_icons_beer1_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/burger15.png") class __ASSET__images_icons_burger15_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/business56.png") class __ASSET__images_icons_business56_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/chainsaw3.png") class __ASSET__images_icons_chainsaw3_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/closed37.png") class __ASSET__images_icons_closed37_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/coffee119.png") class __ASSET__images_icons_coffee119_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/convertible2.png") class __ASSET__images_icons_convertible2_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/flower165.png") class __ASSET__images_icons_flower165_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/fuel14.png") class __ASSET__images_icons_fuel14_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/joystick10.png") class __ASSET__images_icons_joystick10_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/picturetaking.png") class __ASSET__images_icons_picturetaking_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/pizza.png") class __ASSET__images_icons_pizza_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/restaurant.png") class __ASSET__images_icons_restaurant_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/ring28.png") class __ASSET__images_icons_ring28_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/ring5.png") class __ASSET__images_icons_ring5_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/rocket74.png") class __ASSET__images_icons_rocket74_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/sea8.png") class __ASSET__images_icons_sea8_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/shoes13.png") class __ASSET__images_icons_shoes13_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/smartphone24.png") class __ASSET__images_icons_smartphone24_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/smoking4.png") class __ASSET__images_icons_smoking4_png extends lime.graphics.Image {}
@:bitmap("Assets/images/icons/wine56.png") class __ASSET__images_icons_wine56_png extends lime.graphics.Image {}
@:bitmap("Assets/images/triangle.png") class __ASSET__images_triangle_png extends lime.graphics.Image {}
@:bitmap("Assets/images/vkbtn.png") class __ASSET__images_vkbtn_png extends lime.graphics.Image {}
@:bitmap("Assets/images/vkbtnhover.png") class __ASSET__images_vkbtnhover_png extends lime.graphics.Image {}
@:file("Assets/styles/labels.css") class __ASSET__styles_labels_css extends lime.utils.ByteArray {}
@:file("Assets/styles/labels.min.css") class __ASSET__styles_labels_min_css extends lime.utils.ByteArray {}



#end

#end
#end


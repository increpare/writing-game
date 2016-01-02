package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
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
		
		#if (openfl && !flash)
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__data_fonts_opensans_opensans_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("data/fonts/opensans/opensans.eot", __ASSET__data_fonts_opensans_opensans_eot);
		type.set ("data/fonts/opensans/opensans.eot", AssetType.BINARY);
		className.set ("data/fonts/opensans/opensans.ttf", __ASSET__data_fonts_opensans_opensans_ttf);
		type.set ("data/fonts/opensans/opensans.ttf", AssetType.FONT);
		className.set ("data/fonts/opensans/opensans.woff", __ASSET__data_fonts_opensans_opensans_woff);
		type.set ("data/fonts/opensans/opensans.woff", AssetType.BINARY);
		className.set ("data/fonts/opensans/opensans.woff2", __ASSET__data_fonts_opensans_opensans_woff2);
		type.set ("data/fonts/opensans/opensans.woff2", AssetType.BINARY);
		className.set ("data/graphics/bgtiles.png", __ASSET__data_graphics_bgtiles_png);
		type.set ("data/graphics/bgtiles.png", AssetType.IMAGE);
		className.set ("data/graphics/book_blank_l.png", __ASSET__data_graphics_book_blank_l_png);
		type.set ("data/graphics/book_blank_l.png", AssetType.IMAGE);
		className.set ("data/graphics/book_blank_l_stepped.png", __ASSET__data_graphics_book_blank_l_stepped_png);
		type.set ("data/graphics/book_blank_l_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_blank_r.png", __ASSET__data_graphics_book_blank_r_png);
		type.set ("data/graphics/book_blank_r.png", AssetType.IMAGE);
		className.set ("data/graphics/book_blank_r_stepped.png", __ASSET__data_graphics_book_blank_r_stepped_png);
		type.set ("data/graphics/book_blank_r_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_cover.png", __ASSET__data_graphics_book_cover_png);
		type.set ("data/graphics/book_cover.png", AssetType.IMAGE);
		className.set ("data/graphics/book_covermask.png", __ASSET__data_graphics_book_covermask_png);
		type.set ("data/graphics/book_covermask.png", AssetType.IMAGE);
		className.set ("data/graphics/book_default_l.png", __ASSET__data_graphics_book_default_l_png);
		type.set ("data/graphics/book_default_l.png", AssetType.IMAGE);
		className.set ("data/graphics/book_default_l_stepped.png", __ASSET__data_graphics_book_default_l_stepped_png);
		type.set ("data/graphics/book_default_l_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_default_r.png", __ASSET__data_graphics_book_default_r_png);
		type.set ("data/graphics/book_default_r.png", AssetType.IMAGE);
		className.set ("data/graphics/book_default_r_stepped.png", __ASSET__data_graphics_book_default_r_stepped_png);
		type.set ("data/graphics/book_default_r_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_rewritten_l.png", __ASSET__data_graphics_book_rewritten_l_png);
		type.set ("data/graphics/book_rewritten_l.png", AssetType.IMAGE);
		className.set ("data/graphics/book_rewritten_l_stepped.png", __ASSET__data_graphics_book_rewritten_l_stepped_png);
		type.set ("data/graphics/book_rewritten_l_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_rewritten_r.png", __ASSET__data_graphics_book_rewritten_r_png);
		type.set ("data/graphics/book_rewritten_r.png", AssetType.IMAGE);
		className.set ("data/graphics/book_rewritten_r_stepped.png", __ASSET__data_graphics_book_rewritten_r_stepped_png);
		type.set ("data/graphics/book_rewritten_r_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_scored_l.png", __ASSET__data_graphics_book_scored_l_png);
		type.set ("data/graphics/book_scored_l.png", AssetType.IMAGE);
		className.set ("data/graphics/book_scored_l_stepped.png", __ASSET__data_graphics_book_scored_l_stepped_png);
		type.set ("data/graphics/book_scored_l_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/book_scored_r.png", __ASSET__data_graphics_book_scored_r_png);
		type.set ("data/graphics/book_scored_r.png", AssetType.IMAGE);
		className.set ("data/graphics/book_scored_r_stepped.png", __ASSET__data_graphics_book_scored_r_stepped_png);
		type.set ("data/graphics/book_scored_r_stepped.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_0.png", __ASSET__data_graphics_bookanim_0_png);
		type.set ("data/graphics/bookanim_0.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_1.png", __ASSET__data_graphics_bookanim_1_png);
		type.set ("data/graphics/bookanim_1.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_2.png", __ASSET__data_graphics_bookanim_2_png);
		type.set ("data/graphics/bookanim_2.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_3.png", __ASSET__data_graphics_bookanim_3_png);
		type.set ("data/graphics/bookanim_3.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_4.png", __ASSET__data_graphics_bookanim_4_png);
		type.set ("data/graphics/bookanim_4.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_5.png", __ASSET__data_graphics_bookanim_5_png);
		type.set ("data/graphics/bookanim_5.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_6.png", __ASSET__data_graphics_bookanim_6_png);
		type.set ("data/graphics/bookanim_6.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_7.png", __ASSET__data_graphics_bookanim_7_png);
		type.set ("data/graphics/bookanim_7.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_8.png", __ASSET__data_graphics_bookanim_8_png);
		type.set ("data/graphics/bookanim_8.png", AssetType.IMAGE);
		className.set ("data/graphics/bookanim_9.png", __ASSET__data_graphics_bookanim_9_png);
		type.set ("data/graphics/bookanim_9.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_0.png", __ASSET__data_graphics_bookburn_book_burn_0_png);
		type.set ("data/graphics/bookburn/book_burn_0.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_1.png", __ASSET__data_graphics_bookburn_book_burn_1_png);
		type.set ("data/graphics/bookburn/book_burn_1.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_2.png", __ASSET__data_graphics_bookburn_book_burn_2_png);
		type.set ("data/graphics/bookburn/book_burn_2.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_3.png", __ASSET__data_graphics_bookburn_book_burn_3_png);
		type.set ("data/graphics/bookburn/book_burn_3.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_4.png", __ASSET__data_graphics_bookburn_book_burn_4_png);
		type.set ("data/graphics/bookburn/book_burn_4.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_5.png", __ASSET__data_graphics_bookburn_book_burn_5_png);
		type.set ("data/graphics/bookburn/book_burn_5.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_6.png", __ASSET__data_graphics_bookburn_book_burn_6_png);
		type.set ("data/graphics/bookburn/book_burn_6.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_7.png", __ASSET__data_graphics_bookburn_book_burn_7_png);
		type.set ("data/graphics/bookburn/book_burn_7.png", AssetType.IMAGE);
		className.set ("data/graphics/bookburn/book_burn_8.png", __ASSET__data_graphics_bookburn_book_burn_8_png);
		type.set ("data/graphics/bookburn/book_burn_8.png", AssetType.IMAGE);
		className.set ("data/graphics/bookframe.png", __ASSET__data_graphics_bookframe_png);
		type.set ("data/graphics/bookframe.png", AssetType.IMAGE);
		className.set ("data/graphics/brush.png", __ASSET__data_graphics_brush_png);
		type.set ("data/graphics/brush.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_0.png", __ASSET__data_graphics_burn_player_burn_0_png);
		type.set ("data/graphics/burn/player_burn_0.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_1.png", __ASSET__data_graphics_burn_player_burn_1_png);
		type.set ("data/graphics/burn/player_burn_1.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_10.png", __ASSET__data_graphics_burn_player_burn_10_png);
		type.set ("data/graphics/burn/player_burn_10.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_11.png", __ASSET__data_graphics_burn_player_burn_11_png);
		type.set ("data/graphics/burn/player_burn_11.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_12.png", __ASSET__data_graphics_burn_player_burn_12_png);
		type.set ("data/graphics/burn/player_burn_12.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_13.png", __ASSET__data_graphics_burn_player_burn_13_png);
		type.set ("data/graphics/burn/player_burn_13.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_14.png", __ASSET__data_graphics_burn_player_burn_14_png);
		type.set ("data/graphics/burn/player_burn_14.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_15.png", __ASSET__data_graphics_burn_player_burn_15_png);
		type.set ("data/graphics/burn/player_burn_15.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_16.png", __ASSET__data_graphics_burn_player_burn_16_png);
		type.set ("data/graphics/burn/player_burn_16.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_2.png", __ASSET__data_graphics_burn_player_burn_2_png);
		type.set ("data/graphics/burn/player_burn_2.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_3.png", __ASSET__data_graphics_burn_player_burn_3_png);
		type.set ("data/graphics/burn/player_burn_3.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_4.png", __ASSET__data_graphics_burn_player_burn_4_png);
		type.set ("data/graphics/burn/player_burn_4.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_5.png", __ASSET__data_graphics_burn_player_burn_5_png);
		type.set ("data/graphics/burn/player_burn_5.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_6.png", __ASSET__data_graphics_burn_player_burn_6_png);
		type.set ("data/graphics/burn/player_burn_6.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_7.png", __ASSET__data_graphics_burn_player_burn_7_png);
		type.set ("data/graphics/burn/player_burn_7.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_8.png", __ASSET__data_graphics_burn_player_burn_8_png);
		type.set ("data/graphics/burn/player_burn_8.png", AssetType.IMAGE);
		className.set ("data/graphics/burn/player_burn_9.png", __ASSET__data_graphics_burn_player_burn_9_png);
		type.set ("data/graphics/burn/player_burn_9.png", AssetType.IMAGE);
		className.set ("data/graphics/fg_0.png", __ASSET__data_graphics_fg_0_png);
		type.set ("data/graphics/fg_0.png", AssetType.IMAGE);
		className.set ("data/graphics/fg_1.png", __ASSET__data_graphics_fg_1_png);
		type.set ("data/graphics/fg_1.png", AssetType.IMAGE);
		className.set ("data/graphics/fg_2.png", __ASSET__data_graphics_fg_2_png);
		type.set ("data/graphics/fg_2.png", AssetType.IMAGE);
		className.set ("data/graphics/firepit.png", __ASSET__data_graphics_firepit_png);
		type.set ("data/graphics/firepit.png", AssetType.IMAGE);
		className.set ("data/graphics/firepit2.png", __ASSET__data_graphics_firepit2_png);
		type.set ("data/graphics/firepit2.png", AssetType.IMAGE);
		className.set ("data/graphics/firepit2_fg.png", __ASSET__data_graphics_firepit2_fg_png);
		type.set ("data/graphics/firepit2_fg.png", AssetType.IMAGE);
		className.set ("data/graphics/firepit_fg.png", __ASSET__data_graphics_firepit_fg_png);
		type.set ("data/graphics/firepit_fg.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_drop.png", __ASSET__data_graphics_icon_drop_png);
		type.set ("data/graphics/icon_drop.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_exit.png", __ASSET__data_graphics_icon_exit_png);
		type.set ("data/graphics/icon_exit.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_paint.png", __ASSET__data_graphics_icon_paint_png);
		type.set ("data/graphics/icon_paint.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_read.png", __ASSET__data_graphics_icon_read_png);
		type.set ("data/graphics/icon_read.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_steps.png", __ASSET__data_graphics_icon_steps_png);
		type.set ("data/graphics/icon_steps.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_take.png", __ASSET__data_graphics_icon_take_png);
		type.set ("data/graphics/icon_take.png", AssetType.IMAGE);
		className.set ("data/graphics/icon_unlock.png", __ASSET__data_graphics_icon_unlock_png);
		type.set ("data/graphics/icon_unlock.png", AssetType.IMAGE);
		className.set ("data/graphics/key.png", __ASSET__data_graphics_key_png);
		type.set ("data/graphics/key.png", AssetType.IMAGE);
		className.set ("data/graphics/player.png", __ASSET__data_graphics_player_png);
		type.set ("data/graphics/player.png", AssetType.IMAGE);
		className.set ("data/graphics/playerwalk1.png", __ASSET__data_graphics_playerwalk1_png);
		type.set ("data/graphics/playerwalk1.png", AssetType.IMAGE);
		className.set ("data/graphics/playerwalk2.png", __ASSET__data_graphics_playerwalk2_png);
		type.set ("data/graphics/playerwalk2.png", AssetType.IMAGE);
		className.set ("data/graphics/smallbook.png", __ASSET__data_graphics_smallbook_png);
		type.set ("data/graphics/smallbook.png", AssetType.IMAGE);
		className.set ("data/graphics/waterpit.png", __ASSET__data_graphics_waterpit_png);
		type.set ("data/graphics/waterpit.png", AssetType.IMAGE);
		className.set ("data/graphics/waterpit2.png", __ASSET__data_graphics_waterpit2_png);
		type.set ("data/graphics/waterpit2.png", AssetType.IMAGE);
		className.set ("data/graphics/waterpit2_fg.png", __ASSET__data_graphics_waterpit2_fg_png);
		type.set ("data/graphics/waterpit2_fg.png", AssetType.IMAGE);
		className.set ("data/graphics/waterpit_fg.png", __ASSET__data_graphics_waterpit_fg_png);
		type.set ("data/graphics/waterpit_fg.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "data/fonts/opensans/opensans.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "data/fonts/opensans/opensans.ttf";
		className.set (id, __ASSET__data_fonts_opensans_opensans_ttf);
		
		type.set (id, AssetType.FONT);
		id = "data/fonts/opensans/opensans.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "data/fonts/opensans/opensans.woff2";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "data/graphics/bgtiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_blank_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_blank_l_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_blank_r.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_blank_r_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_cover.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_covermask.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_default_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_default_l_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_default_r.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_default_r_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_rewritten_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_rewritten_l_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_rewritten_r.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_rewritten_r_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_scored_l.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_scored_l_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_scored_r.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/book_scored_r_stepped.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookanim_9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookburn/book_burn_8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/bookframe.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/brush.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_11.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_12.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_13.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_14.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_15.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_16.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/burn/player_burn_9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/fg_0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/fg_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/fg_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/firepit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/firepit2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/firepit2_fg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/firepit_fg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_drop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_exit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_paint.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_read.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_steps.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_take.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/icon_unlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/key.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/playerwalk1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/playerwalk2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/smallbook.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/waterpit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/waterpit2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/waterpit2_fg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "data/graphics/waterpit_fg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("data/fonts/opensans/opensans.eot", __ASSET__data_fonts_opensans_opensans_eot);
		type.set ("data/fonts/opensans/opensans.eot", AssetType.BINARY);
		
		className.set ("data/fonts/opensans/opensans.ttf", __ASSET__data_fonts_opensans_opensans_ttf);
		type.set ("data/fonts/opensans/opensans.ttf", AssetType.FONT);
		
		className.set ("data/fonts/opensans/opensans.woff", __ASSET__data_fonts_opensans_opensans_woff);
		type.set ("data/fonts/opensans/opensans.woff", AssetType.BINARY);
		
		className.set ("data/fonts/opensans/opensans.woff2", __ASSET__data_fonts_opensans_opensans_woff2);
		type.set ("data/fonts/opensans/opensans.woff2", AssetType.BINARY);
		
		className.set ("data/graphics/bgtiles.png", __ASSET__data_graphics_bgtiles_png);
		type.set ("data/graphics/bgtiles.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_blank_l.png", __ASSET__data_graphics_book_blank_l_png);
		type.set ("data/graphics/book_blank_l.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_blank_l_stepped.png", __ASSET__data_graphics_book_blank_l_stepped_png);
		type.set ("data/graphics/book_blank_l_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_blank_r.png", __ASSET__data_graphics_book_blank_r_png);
		type.set ("data/graphics/book_blank_r.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_blank_r_stepped.png", __ASSET__data_graphics_book_blank_r_stepped_png);
		type.set ("data/graphics/book_blank_r_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_cover.png", __ASSET__data_graphics_book_cover_png);
		type.set ("data/graphics/book_cover.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_covermask.png", __ASSET__data_graphics_book_covermask_png);
		type.set ("data/graphics/book_covermask.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_default_l.png", __ASSET__data_graphics_book_default_l_png);
		type.set ("data/graphics/book_default_l.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_default_l_stepped.png", __ASSET__data_graphics_book_default_l_stepped_png);
		type.set ("data/graphics/book_default_l_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_default_r.png", __ASSET__data_graphics_book_default_r_png);
		type.set ("data/graphics/book_default_r.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_default_r_stepped.png", __ASSET__data_graphics_book_default_r_stepped_png);
		type.set ("data/graphics/book_default_r_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_rewritten_l.png", __ASSET__data_graphics_book_rewritten_l_png);
		type.set ("data/graphics/book_rewritten_l.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_rewritten_l_stepped.png", __ASSET__data_graphics_book_rewritten_l_stepped_png);
		type.set ("data/graphics/book_rewritten_l_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_rewritten_r.png", __ASSET__data_graphics_book_rewritten_r_png);
		type.set ("data/graphics/book_rewritten_r.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_rewritten_r_stepped.png", __ASSET__data_graphics_book_rewritten_r_stepped_png);
		type.set ("data/graphics/book_rewritten_r_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_scored_l.png", __ASSET__data_graphics_book_scored_l_png);
		type.set ("data/graphics/book_scored_l.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_scored_l_stepped.png", __ASSET__data_graphics_book_scored_l_stepped_png);
		type.set ("data/graphics/book_scored_l_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_scored_r.png", __ASSET__data_graphics_book_scored_r_png);
		type.set ("data/graphics/book_scored_r.png", AssetType.IMAGE);
		
		className.set ("data/graphics/book_scored_r_stepped.png", __ASSET__data_graphics_book_scored_r_stepped_png);
		type.set ("data/graphics/book_scored_r_stepped.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_0.png", __ASSET__data_graphics_bookanim_0_png);
		type.set ("data/graphics/bookanim_0.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_1.png", __ASSET__data_graphics_bookanim_1_png);
		type.set ("data/graphics/bookanim_1.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_2.png", __ASSET__data_graphics_bookanim_2_png);
		type.set ("data/graphics/bookanim_2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_3.png", __ASSET__data_graphics_bookanim_3_png);
		type.set ("data/graphics/bookanim_3.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_4.png", __ASSET__data_graphics_bookanim_4_png);
		type.set ("data/graphics/bookanim_4.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_5.png", __ASSET__data_graphics_bookanim_5_png);
		type.set ("data/graphics/bookanim_5.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_6.png", __ASSET__data_graphics_bookanim_6_png);
		type.set ("data/graphics/bookanim_6.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_7.png", __ASSET__data_graphics_bookanim_7_png);
		type.set ("data/graphics/bookanim_7.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_8.png", __ASSET__data_graphics_bookanim_8_png);
		type.set ("data/graphics/bookanim_8.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookanim_9.png", __ASSET__data_graphics_bookanim_9_png);
		type.set ("data/graphics/bookanim_9.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_0.png", __ASSET__data_graphics_bookburn_book_burn_0_png);
		type.set ("data/graphics/bookburn/book_burn_0.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_1.png", __ASSET__data_graphics_bookburn_book_burn_1_png);
		type.set ("data/graphics/bookburn/book_burn_1.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_2.png", __ASSET__data_graphics_bookburn_book_burn_2_png);
		type.set ("data/graphics/bookburn/book_burn_2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_3.png", __ASSET__data_graphics_bookburn_book_burn_3_png);
		type.set ("data/graphics/bookburn/book_burn_3.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_4.png", __ASSET__data_graphics_bookburn_book_burn_4_png);
		type.set ("data/graphics/bookburn/book_burn_4.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_5.png", __ASSET__data_graphics_bookburn_book_burn_5_png);
		type.set ("data/graphics/bookburn/book_burn_5.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_6.png", __ASSET__data_graphics_bookburn_book_burn_6_png);
		type.set ("data/graphics/bookburn/book_burn_6.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_7.png", __ASSET__data_graphics_bookburn_book_burn_7_png);
		type.set ("data/graphics/bookburn/book_burn_7.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookburn/book_burn_8.png", __ASSET__data_graphics_bookburn_book_burn_8_png);
		type.set ("data/graphics/bookburn/book_burn_8.png", AssetType.IMAGE);
		
		className.set ("data/graphics/bookframe.png", __ASSET__data_graphics_bookframe_png);
		type.set ("data/graphics/bookframe.png", AssetType.IMAGE);
		
		className.set ("data/graphics/brush.png", __ASSET__data_graphics_brush_png);
		type.set ("data/graphics/brush.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_0.png", __ASSET__data_graphics_burn_player_burn_0_png);
		type.set ("data/graphics/burn/player_burn_0.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_1.png", __ASSET__data_graphics_burn_player_burn_1_png);
		type.set ("data/graphics/burn/player_burn_1.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_10.png", __ASSET__data_graphics_burn_player_burn_10_png);
		type.set ("data/graphics/burn/player_burn_10.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_11.png", __ASSET__data_graphics_burn_player_burn_11_png);
		type.set ("data/graphics/burn/player_burn_11.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_12.png", __ASSET__data_graphics_burn_player_burn_12_png);
		type.set ("data/graphics/burn/player_burn_12.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_13.png", __ASSET__data_graphics_burn_player_burn_13_png);
		type.set ("data/graphics/burn/player_burn_13.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_14.png", __ASSET__data_graphics_burn_player_burn_14_png);
		type.set ("data/graphics/burn/player_burn_14.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_15.png", __ASSET__data_graphics_burn_player_burn_15_png);
		type.set ("data/graphics/burn/player_burn_15.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_16.png", __ASSET__data_graphics_burn_player_burn_16_png);
		type.set ("data/graphics/burn/player_burn_16.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_2.png", __ASSET__data_graphics_burn_player_burn_2_png);
		type.set ("data/graphics/burn/player_burn_2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_3.png", __ASSET__data_graphics_burn_player_burn_3_png);
		type.set ("data/graphics/burn/player_burn_3.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_4.png", __ASSET__data_graphics_burn_player_burn_4_png);
		type.set ("data/graphics/burn/player_burn_4.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_5.png", __ASSET__data_graphics_burn_player_burn_5_png);
		type.set ("data/graphics/burn/player_burn_5.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_6.png", __ASSET__data_graphics_burn_player_burn_6_png);
		type.set ("data/graphics/burn/player_burn_6.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_7.png", __ASSET__data_graphics_burn_player_burn_7_png);
		type.set ("data/graphics/burn/player_burn_7.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_8.png", __ASSET__data_graphics_burn_player_burn_8_png);
		type.set ("data/graphics/burn/player_burn_8.png", AssetType.IMAGE);
		
		className.set ("data/graphics/burn/player_burn_9.png", __ASSET__data_graphics_burn_player_burn_9_png);
		type.set ("data/graphics/burn/player_burn_9.png", AssetType.IMAGE);
		
		className.set ("data/graphics/fg_0.png", __ASSET__data_graphics_fg_0_png);
		type.set ("data/graphics/fg_0.png", AssetType.IMAGE);
		
		className.set ("data/graphics/fg_1.png", __ASSET__data_graphics_fg_1_png);
		type.set ("data/graphics/fg_1.png", AssetType.IMAGE);
		
		className.set ("data/graphics/fg_2.png", __ASSET__data_graphics_fg_2_png);
		type.set ("data/graphics/fg_2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/firepit.png", __ASSET__data_graphics_firepit_png);
		type.set ("data/graphics/firepit.png", AssetType.IMAGE);
		
		className.set ("data/graphics/firepit2.png", __ASSET__data_graphics_firepit2_png);
		type.set ("data/graphics/firepit2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/firepit2_fg.png", __ASSET__data_graphics_firepit2_fg_png);
		type.set ("data/graphics/firepit2_fg.png", AssetType.IMAGE);
		
		className.set ("data/graphics/firepit_fg.png", __ASSET__data_graphics_firepit_fg_png);
		type.set ("data/graphics/firepit_fg.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_drop.png", __ASSET__data_graphics_icon_drop_png);
		type.set ("data/graphics/icon_drop.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_exit.png", __ASSET__data_graphics_icon_exit_png);
		type.set ("data/graphics/icon_exit.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_paint.png", __ASSET__data_graphics_icon_paint_png);
		type.set ("data/graphics/icon_paint.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_read.png", __ASSET__data_graphics_icon_read_png);
		type.set ("data/graphics/icon_read.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_steps.png", __ASSET__data_graphics_icon_steps_png);
		type.set ("data/graphics/icon_steps.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_take.png", __ASSET__data_graphics_icon_take_png);
		type.set ("data/graphics/icon_take.png", AssetType.IMAGE);
		
		className.set ("data/graphics/icon_unlock.png", __ASSET__data_graphics_icon_unlock_png);
		type.set ("data/graphics/icon_unlock.png", AssetType.IMAGE);
		
		className.set ("data/graphics/key.png", __ASSET__data_graphics_key_png);
		type.set ("data/graphics/key.png", AssetType.IMAGE);
		
		className.set ("data/graphics/player.png", __ASSET__data_graphics_player_png);
		type.set ("data/graphics/player.png", AssetType.IMAGE);
		
		className.set ("data/graphics/playerwalk1.png", __ASSET__data_graphics_playerwalk1_png);
		type.set ("data/graphics/playerwalk1.png", AssetType.IMAGE);
		
		className.set ("data/graphics/playerwalk2.png", __ASSET__data_graphics_playerwalk2_png);
		type.set ("data/graphics/playerwalk2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/smallbook.png", __ASSET__data_graphics_smallbook_png);
		type.set ("data/graphics/smallbook.png", AssetType.IMAGE);
		
		className.set ("data/graphics/waterpit.png", __ASSET__data_graphics_waterpit_png);
		type.set ("data/graphics/waterpit.png", AssetType.IMAGE);
		
		className.set ("data/graphics/waterpit2.png", __ASSET__data_graphics_waterpit2_png);
		type.set ("data/graphics/waterpit2.png", AssetType.IMAGE);
		
		className.set ("data/graphics/waterpit2_fg.png", __ASSET__data_graphics_waterpit2_fg_png);
		type.set ("data/graphics/waterpit2_fg.png", AssetType.IMAGE);
		
		className.set ("data/graphics/waterpit_fg.png", __ASSET__data_graphics_waterpit_fg_png);
		type.set ("data/graphics/waterpit_fg.png", AssetType.IMAGE);
		
		
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
						
						onChange.dispatch ();
						
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
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
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
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
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
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
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
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
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
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__data_fonts_opensans_opensans_eot extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_opensans_opensans_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_opensans_opensans_woff extends null { }
@:keep @:bind #if display private #end class __ASSET__data_fonts_opensans_opensans_woff2 extends null { }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bgtiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_blank_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_blank_l_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_blank_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_blank_r_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_cover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_covermask_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_default_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_default_l_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_default_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_default_r_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_rewritten_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_rewritten_l_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_rewritten_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_rewritten_r_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_scored_l_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_scored_l_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_scored_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_book_scored_r_stepped_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookanim_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookburn_book_burn_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_bookframe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_brush_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_13_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_15_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_16_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_burn_player_burn_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fg_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fg_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_fg_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_firepit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_firepit2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_firepit2_fg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_firepit_fg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_drop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_exit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_paint_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_read_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_steps_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_take_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_icon_unlock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_key_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_playerwalk1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_playerwalk2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_smallbook_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_waterpit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_waterpit2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_waterpit2_fg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__data_graphics_waterpit_fg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5


@:keep #if display private #end class __ASSET__data_fonts_opensans_opensans_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans"; } } 




















































































#else



#if (windows || mac || linux || cpp)


@:file("data/fonts/opensans/opensans.eot") #if display private #end class __ASSET__data_fonts_opensans_opensans_eot extends lime.utils.Bytes {}
@:font("data/fonts/opensans/opensans.ttf") #if display private #end class __ASSET__data_fonts_opensans_opensans_ttf extends lime.text.Font {}
@:file("data/fonts/opensans/opensans.woff") #if display private #end class __ASSET__data_fonts_opensans_opensans_woff extends lime.utils.Bytes {}
@:file("data/fonts/opensans/opensans.woff2") #if display private #end class __ASSET__data_fonts_opensans_opensans_woff2 extends lime.utils.Bytes {}
@:image("data/graphics/bgtiles.png") #if display private #end class __ASSET__data_graphics_bgtiles_png extends lime.graphics.Image {}
@:image("data/graphics/book_blank_l.png") #if display private #end class __ASSET__data_graphics_book_blank_l_png extends lime.graphics.Image {}
@:image("data/graphics/book_blank_l_stepped.png") #if display private #end class __ASSET__data_graphics_book_blank_l_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_blank_r.png") #if display private #end class __ASSET__data_graphics_book_blank_r_png extends lime.graphics.Image {}
@:image("data/graphics/book_blank_r_stepped.png") #if display private #end class __ASSET__data_graphics_book_blank_r_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_cover.png") #if display private #end class __ASSET__data_graphics_book_cover_png extends lime.graphics.Image {}
@:image("data/graphics/book_covermask.png") #if display private #end class __ASSET__data_graphics_book_covermask_png extends lime.graphics.Image {}
@:image("data/graphics/book_default_l.png") #if display private #end class __ASSET__data_graphics_book_default_l_png extends lime.graphics.Image {}
@:image("data/graphics/book_default_l_stepped.png") #if display private #end class __ASSET__data_graphics_book_default_l_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_default_r.png") #if display private #end class __ASSET__data_graphics_book_default_r_png extends lime.graphics.Image {}
@:image("data/graphics/book_default_r_stepped.png") #if display private #end class __ASSET__data_graphics_book_default_r_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_rewritten_l.png") #if display private #end class __ASSET__data_graphics_book_rewritten_l_png extends lime.graphics.Image {}
@:image("data/graphics/book_rewritten_l_stepped.png") #if display private #end class __ASSET__data_graphics_book_rewritten_l_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_rewritten_r.png") #if display private #end class __ASSET__data_graphics_book_rewritten_r_png extends lime.graphics.Image {}
@:image("data/graphics/book_rewritten_r_stepped.png") #if display private #end class __ASSET__data_graphics_book_rewritten_r_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_scored_l.png") #if display private #end class __ASSET__data_graphics_book_scored_l_png extends lime.graphics.Image {}
@:image("data/graphics/book_scored_l_stepped.png") #if display private #end class __ASSET__data_graphics_book_scored_l_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/book_scored_r.png") #if display private #end class __ASSET__data_graphics_book_scored_r_png extends lime.graphics.Image {}
@:image("data/graphics/book_scored_r_stepped.png") #if display private #end class __ASSET__data_graphics_book_scored_r_stepped_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_0.png") #if display private #end class __ASSET__data_graphics_bookanim_0_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_1.png") #if display private #end class __ASSET__data_graphics_bookanim_1_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_2.png") #if display private #end class __ASSET__data_graphics_bookanim_2_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_3.png") #if display private #end class __ASSET__data_graphics_bookanim_3_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_4.png") #if display private #end class __ASSET__data_graphics_bookanim_4_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_5.png") #if display private #end class __ASSET__data_graphics_bookanim_5_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_6.png") #if display private #end class __ASSET__data_graphics_bookanim_6_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_7.png") #if display private #end class __ASSET__data_graphics_bookanim_7_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_8.png") #if display private #end class __ASSET__data_graphics_bookanim_8_png extends lime.graphics.Image {}
@:image("data/graphics/bookanim_9.png") #if display private #end class __ASSET__data_graphics_bookanim_9_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_0.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_0_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_1.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_1_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_2.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_2_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_3.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_3_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_4.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_4_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_5.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_5_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_6.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_6_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_7.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_7_png extends lime.graphics.Image {}
@:image("data/graphics/bookburn/book_burn_8.png") #if display private #end class __ASSET__data_graphics_bookburn_book_burn_8_png extends lime.graphics.Image {}
@:image("data/graphics/bookframe.png") #if display private #end class __ASSET__data_graphics_bookframe_png extends lime.graphics.Image {}
@:image("data/graphics/brush.png") #if display private #end class __ASSET__data_graphics_brush_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_0.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_0_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_1.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_1_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_10.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_10_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_11.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_11_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_12.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_12_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_13.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_13_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_14.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_14_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_15.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_15_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_16.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_16_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_2.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_2_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_3.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_3_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_4.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_4_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_5.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_5_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_6.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_6_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_7.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_7_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_8.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_8_png extends lime.graphics.Image {}
@:image("data/graphics/burn/player_burn_9.png") #if display private #end class __ASSET__data_graphics_burn_player_burn_9_png extends lime.graphics.Image {}
@:image("data/graphics/fg_0.png") #if display private #end class __ASSET__data_graphics_fg_0_png extends lime.graphics.Image {}
@:image("data/graphics/fg_1.png") #if display private #end class __ASSET__data_graphics_fg_1_png extends lime.graphics.Image {}
@:image("data/graphics/fg_2.png") #if display private #end class __ASSET__data_graphics_fg_2_png extends lime.graphics.Image {}
@:image("data/graphics/firepit.png") #if display private #end class __ASSET__data_graphics_firepit_png extends lime.graphics.Image {}
@:image("data/graphics/firepit2.png") #if display private #end class __ASSET__data_graphics_firepit2_png extends lime.graphics.Image {}
@:image("data/graphics/firepit2_fg.png") #if display private #end class __ASSET__data_graphics_firepit2_fg_png extends lime.graphics.Image {}
@:image("data/graphics/firepit_fg.png") #if display private #end class __ASSET__data_graphics_firepit_fg_png extends lime.graphics.Image {}
@:image("data/graphics/icon_drop.png") #if display private #end class __ASSET__data_graphics_icon_drop_png extends lime.graphics.Image {}
@:image("data/graphics/icon_exit.png") #if display private #end class __ASSET__data_graphics_icon_exit_png extends lime.graphics.Image {}
@:image("data/graphics/icon_paint.png") #if display private #end class __ASSET__data_graphics_icon_paint_png extends lime.graphics.Image {}
@:image("data/graphics/icon_read.png") #if display private #end class __ASSET__data_graphics_icon_read_png extends lime.graphics.Image {}
@:image("data/graphics/icon_steps.png") #if display private #end class __ASSET__data_graphics_icon_steps_png extends lime.graphics.Image {}
@:image("data/graphics/icon_take.png") #if display private #end class __ASSET__data_graphics_icon_take_png extends lime.graphics.Image {}
@:image("data/graphics/icon_unlock.png") #if display private #end class __ASSET__data_graphics_icon_unlock_png extends lime.graphics.Image {}
@:image("data/graphics/key.png") #if display private #end class __ASSET__data_graphics_key_png extends lime.graphics.Image {}
@:image("data/graphics/player.png") #if display private #end class __ASSET__data_graphics_player_png extends lime.graphics.Image {}
@:image("data/graphics/playerwalk1.png") #if display private #end class __ASSET__data_graphics_playerwalk1_png extends lime.graphics.Image {}
@:image("data/graphics/playerwalk2.png") #if display private #end class __ASSET__data_graphics_playerwalk2_png extends lime.graphics.Image {}
@:image("data/graphics/smallbook.png") #if display private #end class __ASSET__data_graphics_smallbook_png extends lime.graphics.Image {}
@:image("data/graphics/waterpit.png") #if display private #end class __ASSET__data_graphics_waterpit_png extends lime.graphics.Image {}
@:image("data/graphics/waterpit2.png") #if display private #end class __ASSET__data_graphics_waterpit2_png extends lime.graphics.Image {}
@:image("data/graphics/waterpit2_fg.png") #if display private #end class __ASSET__data_graphics_waterpit2_fg_png extends lime.graphics.Image {}
@:image("data/graphics/waterpit_fg.png") #if display private #end class __ASSET__data_graphics_waterpit_fg_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__data_fonts_opensans_opensans_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__data_fonts_opensans_opensans_ttf (); src = font.src; name = font.name; super (); }}

#end

#end
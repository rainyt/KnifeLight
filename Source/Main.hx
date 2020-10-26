package;

import openfl.events.TouchEvent;
import openfl.Assets;
import openfl.display.BlendMode;
#if zygame
import zygame.display.batch.ImageBatchs;
import zygame.components.ZQuad;
import zygame.utils.FrameEngine;
import zygame.utils.Lib;
import zygame.utils.ZAssets;
import zygame.core.Start;
#else
import openfl.display.Sprite;
#end

class Main extends #if zygame Start #else Sprite #end {
	public function new() {
		#if zygame
		super(640, 1000, true);
		#else
		super();
		onInit();
		#end
	}

	private var _k:KnifeLight;

	#if zygame override #end function onInit() {
		stage.color = 0xff00ff;

		#if zygame
		super.onInit();
		var quad:ZQuad = new ZQuad();
		this.addChild(quad);
		quad.width = getStageWidth();
		quad.height = getStageHeight();
		var assets:ZAssets = new ZAssets();
		assets.loadFile("assets/color2.png");
		assets.start((f) -> {
			if (f == 1) {
				trace("刀光！");
				var knife = new KnifeLight(assets.getBitmapData("color2"),60,0.5);
				this.addChild(knife);
				_k = knife;
				this.setTouchEvent(true);
			}
		});
		#else
		var knife = new KnifeLight(Assets.getBitmapData("assets/color2.png"));
		this.addChild(knife);
		// knife.blendMode = BlendMode.ADD;
		#end
	}
	
	#if zygame
	override function onTouchBegin(e:TouchEvent) {
		super.onTouchBegin(e);
		_k.onTouch(e);
	}

	override function onTouchEnd(e:TouchEvent) {
		super.onTouchEnd(e);
		_k.onTouch(e);
	}

	override function onTouchMove(e:TouchEvent) {
		super.onTouchMove(e);
		_k.onTouch(e);
	}
	#end
}

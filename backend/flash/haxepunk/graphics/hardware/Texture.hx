package haxepunk.graphics.hardware;

import haxepunk.utils.Color;

import flash.display.BitmapData;
import flash.geom.Point;

@:forward(getPixel, setPixel, clone, dispose)
abstract Texture(BitmapData) from BitmapData to BitmapData
{
	public var width(get, never):Int;
	inline function get_width() return this == null ? 0 : this.width;

	public var height(get, never):Int;
	inline function get_height() return this == null ? 0 : this.height;

	public static inline function create(width:Int, height:Int, transparent:Bool=false, color:Color=0):Texture
	{
		return new BitmapData(width, height, transparent, color);
	}

	public inline function removeColor(color:Color)
	{
		this.threshold(this, this.rect, _zero, "==", color, 0x00000000, 0xFFFFFFFF, true);
	}

	public inline function clearColor(color:Color)
	{
		this.fillRect(this.rect, color);
	}

	public function drawCircle(x:Float, y:Float, radius:Float)
	{
		var sprite = new flash.display.Sprite();
		sprite.graphics.clear();
		sprite.graphics.beginFill(0xFFFFFF);
		sprite.graphics.drawCircle(x, y, radius);
		this.draw(sprite);
	}

  public function drawEllipse(x:Float, y:Float, radiusX:Float, radiusY:Float) {
    var sprite = new flash.display.Sprite();
    sprite.graphics.clear();
    sprite.graphics.beginFill(0xFFFFFF);
    sprite.graphics.drawEllipse(x, y, radiusX, radiusY);
    this.draw(sprite);
  }

  public function drawTexture(x:Float, y:Float, texture:Texture, sourceRect:flash.geom.Rectangle) {
    //this.copyPixels(texture, clipRect
    //var transform = new flash.geom.Matrix();
    //transform.translate(x, y);
    //var clipRect = new flash.geom.Rectangle(0, 0, 16, 16);
    //this.draw(texture, transform, null, null, clipRect, false);
    this.copyPixels(texture, sourceRect, new flash.geom.Point(x, y));
    //var width = clipRect == null ? 16 : clipRect.width;
    //var height = clipRect == null ? 16 : clipRect.height;
    //this.fillRect(new flash.geom.Rectangle(x, y, width, height), 0xFFFFFFFF);
  }

  public function clearRect(rect:flash.geom.Rectangle) {
    this.fillRect(rect, 0x00000000);
  }

	static var _zero = new Point(0, 0);
}

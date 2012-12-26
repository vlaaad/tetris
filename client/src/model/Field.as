/**
 * Created 25.12.12 by vlaaad
 */
package model {
import flash.events.Event;
import flash.events.EventDispatcher;

public class Field extends EventDispatcher {

	private static function hashPosition(x:uint, y:uint):String {
		return x + ":" + y;
	}

	private static function coordinateFromHash(hash:String):Coordinate {
		const arr:Array = hash.split(":");
		return new Coordinate(arr[0], arr[1]);
	}

	private var _width:uint;
	private var _height:uint;

	private var cache:Object = {};

	public function Field(width:uint, height:uint) {
		_width = width;
		_height = height;
	}

	public function get width():uint {
		return _width;
	}

	public function get height():uint {
		return _height;
	}

	public function get(x:int, y:int):Cell {
		return cache[hashPosition(x, y)] as Cell;
	}

	public function set(x:int, y:int, cell:Cell):void {
		if(x<0 || y < 0 || x >= width || y >= height)
			throw new Error("invalid coordinate to set: " + x + ", " + y);
		if (get(x, y) == cell)
			return;
		cache[hashPosition(x, y)] = cell;
		dispatchEvent(new Event(Event.CHANGE));
	}

	public function clear():void {
		cache = {};
		dispatchEvent(new Event(Event.CHANGE));
	}

	public function getAll(type:Cell):Vector.<Coordinate> {
		const result:Vector.<Coordinate> = new Vector.<Coordinate>();
		for (var key:String in cache) {
			const toCheck:Cell = cache[key] as Cell;
			if (toCheck == type) {
				result.push(coordinateFromHash(key));
			}
		}
		return result;
	}
}
}

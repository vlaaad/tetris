/**
 * Created 25.12.12 by vlaaad
 */
package model {
public class Coordinate {
	public var x:int;
	public var y:int;

	public function Coordinate(x:int = 0, y:int = 0) {
		this.x = x;
		this.y = y;
	}

	public function clone(offsetX:int = 0, offsetY:int = 0):Coordinate {
		return new Coordinate(x + offsetX, y + offsetY);
	}

	public function equal(to:Coordinate):Boolean {
		return x == to.x && y == to.y;
	}

	public function add(x:int, y:int):void {
		this.x += x;
		this.y += y;
	}
}
}

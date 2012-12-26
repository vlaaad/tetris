/**
 * Created 26.12.12 by vlaaad
 */
package util {
import model.Coordinate;

public class CoordinateUtil {
	public static function existsAt(x:int,y:int, list:Vector.<Coordinate>):Boolean{
		for each(var c:Coordinate in list) {
			if (c.x == x && c.y == y)
				return true;
		}
		return false;
	}

	public static function getHeight(moving:Vector.<Coordinate>):uint {
		var min:int = int.MAX_VALUE;
		var max:int = int.MIN_VALUE;
		for each(var c:Coordinate in moving) {
			if (c.y > max) max = c.y;
			if (c.y < min) min = c.y;
		}
		return max - min + 1;
	}


	public static function getWidth(moving:Vector.<Coordinate>):uint {
		var min:int = int.MAX_VALUE;
		var max:int = int.MIN_VALUE;
		for each(var c:Coordinate in moving) {
			if (c.x > max) max = c.x;
			if (c.x < min) min = c.x;
		}
		return max - min + 1;
	}

	public static function findLeftCorner(moving:Vector.<Coordinate>):Coordinate {
		var minx:int = int.MAX_VALUE;
		var miny:int = int.MAX_VALUE;
		for each(var c:Coordinate in moving) {
			if (c.x < minx) minx = c.x;
			if (c.y < miny) miny = c.y;
		}
		return new Coordinate(minx, miny);
	}

	public static function getRotated(moving:Vector.<Coordinate>):Vector.<Coordinate> {
		const result:Vector.<Coordinate> = new Vector.<Coordinate>();
		const leftCorner:Coordinate = CoordinateUtil.findLeftCorner(moving);
		for each(var c:Coordinate in moving) {
			var localX:int = c.x - leftCorner.x;
			var localY:int = c.y - leftCorner.y;
			var rotated:Coordinate = new Coordinate(-localY, +localX);
			result.push(rotated);
		}
		const movingWidth:uint = CoordinateUtil.getWidth(moving);
		const movingHeight:uint = CoordinateUtil.getHeight(moving);
		for each(c in result) {
			c.add(leftCorner.x, leftCorner.y);
			c.add(Math.ceil(movingHeight / 2), movingWidth / 2 - 0.5);
		}
		return result;
	}
}
}

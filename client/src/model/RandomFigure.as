/**
 * Created 25.12.12 by vlaaad
 */
package model {
import util.RandomUtil;

public class RandomFigure {

	private static function getAvailableCoords(toExclude:Vector.<Coordinate>, root:Coordinate):Vector.<Coordinate> {
		const result:Vector.<Coordinate> = new Vector.<Coordinate>();
		addIfNotExistEqual(root.clone(-1, 0));
		addIfNotExistEqual(root.clone(1, 0));
		addIfNotExistEqual(root.clone(0, -1));
		addIfNotExistEqual(root.clone(0, 1));
		return result;

		function addIfNotExistEqual(coord:Coordinate):void {
			if (!hasEqual(toExclude, coord)) {
				result.push(coord);
			}
		}
	}

	private static function hasEqual(list:Vector.<Coordinate>, check:Coordinate):Boolean {
		for each(var c:Coordinate in list) {
			if (c.equal(check)) return true;
		}
		return false;
	}

	private var _coordinates:Vector.<Coordinate>;
	private var _width:int;
	private var _height:int;

	public function RandomFigure() {
		init();
	}

	private function init():void {
		const coordinates:Vector.<Coordinate> = new Vector.<Coordinate>();
		coordinates.push(new Coordinate(0, 0));
		for (var i:int = 1; i < 4; i++) {
			var root:Coordinate = coordinates[RandomUtil.index(coordinates.length)];
			var availableCoords:Vector.<Coordinate> = getAvailableCoords(coordinates, root);
			coordinates.push(availableCoords[RandomUtil.index(availableCoords.length)]);
		}
		_coordinates = coordinates;
		var minX:int = int.MAX_VALUE;
		var minY:int = int.MAX_VALUE;
		var maxX:int = int.MIN_VALUE;
		var maxY:int = int.MIN_VALUE;
		for each(var c:Coordinate in coordinates) {
			if (c.x < minX) minX = c.x;
			if (c.x > maxX) maxX = c.x;
			if (c.y < minY) minY = c.y;
			if (c.y > maxY) maxY = c.y;
		}
		_width = maxX - minX + 1;
		_height = maxY - minY + 1;

	}

	public function moveTo0():void {
		var minX:int = 0;
		var minY:int = 0;
		for each(var c:Coordinate in _coordinates) {
			if (c.x < minX) minX = c.x;
			if (c.y < minY) minY = c.y;
		}
		for each(c in _coordinates) {
			c.add(-minX, -minY);
		}
	}

	public function get coordinates():Vector.<Coordinate> {
		return _coordinates;
	}

	public function get width():int {
		return _width;
	}

	public function get height():int {
		return _height;
	}

	public function move(dx:int, dy:int):void {
		for each(var c:Coordinate in _coordinates) {
			c.add(dx, dy);
		}
	}
}
}

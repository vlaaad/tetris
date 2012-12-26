/**
 * Created 26.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.Cell;
import model.Coordinate;
import model.Field;

import util.CoordinateUtil;

import util.CoordinateUtil;

import util.CoordinateUtil;

import util.CoordinateUtil;

public class RotateMovingCommand implements ICommand {

	[Inject]
	public var field:Field;

	public function execute():void {
		const moving:Vector.<Coordinate> = field.getAll(Cell.moving);
		const rotated:Vector.<Coordinate> = CoordinateUtil.getRotated(moving);
		const offset:Coordinate = getBoundsOffset(rotated);
		for each(var c:Coordinate in rotated) {
			c.add(offset.x, offset.y);
		}

		if (!inBounds(rotated))
			return;
		for each(c in rotated) {
			if (field.get(c.x, c.y) == Cell.existing)
				return;
		}
		for each(c in moving) {
			field.set(c.x, c.y, null);
		}
		for each(c in rotated) {
			field.set(c.x, c.y, Cell.moving);
		}
	}

	private function getBoundsOffset(rotated:Vector.<Coordinate>):Coordinate {
		var dx:int = 0;
		var dy:int = 0;
		for each(var c:Coordinate in rotated) {
			if (c.x < 0) dx = -c.x;
			if (c.y < 0) dy = -c.y;
			if (c.x >= field.width) dx = c.x - field.width - 1;
			if (c.y >= field.height) dy = c.y - field.height - 1;
		}
		return new Coordinate(dx, dy);
	}

	private function inBounds(rotated:Vector.<Coordinate>):Boolean {
		for each(var c:Coordinate in rotated) {
			if (c.x < 0 || c.y < 0 || c.x >= field.width || c.y >= field.height)
				return false;
		}
		return true;
	}



	public function get isSingleton():Boolean {
		return true;
	}
}
}

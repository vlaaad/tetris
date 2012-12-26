/**
 * Created 26.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.Cell;

import model.Coordinate;
import model.Field;

import util.CoordinateUtil;

public class MoveMovingRightCommand implements ICommand {
	[Inject] public var field:Field;

	public function execute():void {
		const moving:Vector.<Coordinate> = field.getAll(Cell.moving);
		if (!canMoveRight(moving))
			return;
		for each(var c:Coordinate in moving) {
			if (!CoordinateUtil.existsAt(c.x - 1, c.y, moving)) {
				field.set(c.x, c.y, null);
			}
			field.set(c.x + 1, c.y, Cell.moving)
		}
	}


	private function canMoveRight(moving:Vector.<Coordinate>):Boolean {
		for each(var c:Coordinate in moving) {
			if (field.get(c.x + 1, c.y) == Cell.existing || c.x == field.width - 1)
				return false;
		}
		return true;
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

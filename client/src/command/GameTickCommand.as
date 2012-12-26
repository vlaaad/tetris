/**
 * Created 25.12.12 by vlaaad
 */
package command {
import command.ICommand;
import controller.ICommandExecutor;

import model.Cell;
import model.Coordinate;
import model.Field;

import util.CoordinateUtil;

public class GameTickCommand implements ICommand {

	[Inject] public var field:Field;
	[Inject] public var executor:ICommandExecutor;

	public function execute():void {
		const moving:Vector.<Coordinate> = field.getAll(Cell.moving);
		if (moving.length == 0) {
			executor.execute(SpawnNewFigureCommand);
		} else if (!canMoveDown(moving)) {
			setExisting(moving);
			executor.execute(CheckRowAndDestroyCommand);
			executor.execute(SpawnNewFigureCommand);
		} else {
			moveDown(moving);
		}
	}

	private function setExisting(moving:Vector.<Coordinate>):void {
		for each (var c:Coordinate in moving) {
			field.set(c.x, c.y, Cell.existing);
		}
	}

	private function moveDown(moving:Vector.<Coordinate>):void {
		for each (var c:Coordinate in moving) {
			if (!CoordinateUtil.existsAt(c.x, c.y - 1, moving)) field.set(c.x, c.y, null);
			field.set(c.x, c.y + 1, Cell.moving);
		}
	}

	private function canMoveDown(movingCells:Vector.<Coordinate>):Boolean {
		for each(var c:Coordinate in movingCells) {
			if (c.y >= field.height - 1  || field.get(c.x, c.y + 1) == Cell.existing)
				return false;
		}
		return true;
	}

	public function get isSingleton():Boolean {
		return false;
	}
}
}

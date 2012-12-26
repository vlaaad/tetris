/**
 * Created 26.12.12 by vlaaad
 */
package command {
import command.ICommand;
import controller.ICommandExecutor;

import model.Cell;
import model.Field;
import model.Score;

public class CheckRowAndDestroyCommand implements ICommand {
	[Inject] public var field:Field;
	[Inject] public var executor:ICommandExecutor;

	public function execute():void {
		for (var i:int = field.height - 1; i >= 0; i--) {
			if (rowCanBeDestroyed(i)) {
				destroyRow(i);
				i++;
			}
		}

	}

	private function destroyRow(y:int):void {
		for (var i:int = y; i > 0; i--) {
			for (var j:int = 0; j < field.width; j++) {
				field.set(j, i, field.get(j, i - 1));
			}
		}
		executor.execute(IncrementScore)
	}

	private function rowCanBeDestroyed(y:int):Boolean {
		for (var i:int = 0; i < field.width; i++) {
			if (field.get(i, y) != Cell.existing)
				return false;
		}
		return true;
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

/**
 * Created 25.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.Cell;
import model.Coordinate;
import model.Field;
import model.RandomFigure;
import model.gamestates.GameStateMachine;
import model.gamestates.GameStates;
import model.gamestates.IGameState;

public class SpawnNewFigureCommand implements ICommand {
	[Inject] public var field:Field;
	[Inject] public var stateMachine:GameStateMachine;
	[Inject(name=GameStates.endGame)] public var endGameState:IGameState;

	public function execute():void {
		const figure:RandomFigure = new RandomFigure();
		figure.moveTo0();
		var dx:int = field.width / 2 - figure.width / 2;
		figure.move(dx, 0);
		for each (var c:Coordinate in figure.coordinates) {
			if (field.get(c.x, c.y) == Cell.existing) {
				stateMachine.setState(endGameState);
				return;
			}
		}
		for each (c in figure.coordinates) {
			field.set(c.x, c.y, Cell.moving);
		}
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

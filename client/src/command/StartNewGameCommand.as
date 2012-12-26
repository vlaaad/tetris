/**
 * Created 25.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.gamestates.GameStateMachine;
import model.gamestates.GameStates;
import model.gamestates.IGameState;

public class StartNewGameCommand implements ICommand {

	[Inject] public var stateMachine:GameStateMachine;
	[Inject(name=GameStates.playGame)] public var state:IGameState;

	public function execute():void {
		stateMachine.setState(state);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

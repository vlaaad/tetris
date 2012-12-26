/**
 * Created 26.12.12 by vlaaad
 */
package model.gamestates.custom {
import command.HideFieldViewCommand;
import command.HideScoreView;
import command.ShowFieldViewCommand;
import command.ShowScoreView;
import command.StartGameTimerCommand;
import command.StartListenGameUserInput;
import command.StopGameTimerCommand;
import command.StopListenGameUserInput;

import controller.ICommandExecutor;

import model.gamestates.IGameState;

public class PlayGameState implements IGameState {

	[Inject] public var executor:ICommandExecutor;

	public function PlayGameState() {
	}

	public function onExit():void {
		executor.execute(HideFieldViewCommand);
		executor.execute(HideScoreView);
		executor.execute(StopGameTimerCommand);
		executor.execute(StopListenGameUserInput);
	}

	public function onEnter():void {
		executor.execute(ShowFieldViewCommand);
		executor.execute(StartGameTimerCommand);
		executor.execute(ShowScoreView);
		executor.execute(StartListenGameUserInput);
	}
}
}

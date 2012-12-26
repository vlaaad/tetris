/**
 * Created 25.12.12 by vlaaad
 */
package model.gamestates {
public class GameStateMachine {
	private var _currentState:IGameState;

	public function GameStateMachine() {
	}

	public function setState(state:IGameState):void {
		if (_currentState)
			_currentState.onExit();
		_currentState = state;
		_currentState.onEnter();
	}

	public function get currentState():IGameState {
		return _currentState;
	}
}
}

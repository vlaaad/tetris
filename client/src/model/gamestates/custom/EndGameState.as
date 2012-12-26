/**
 * Created 26.12.12 by vlaaad
 */
package model.gamestates.custom {
import flash.utils.Timer;

import controller.ICommandExecutor;

import model.Field;
import model.gamestates.GameStateMachine;
import model.gamestates.GameStates;

import model.gamestates.IGameState;

public class EndGameState implements IGameState {

	[Inject] public var executor:ICommandExecutor;
	[Inject] public var field:Field;
	[Inject] public var timer:Timer;
	[Inject] public var sm:GameStateMachine;
	[Inject(name=GameStates.initGame)] public var s:IGameState;

	public function onExit():void {

	}

	public function onEnter():void {
		field.clear();
		timer.delay = 500;
		sm.setState(s);
	}
}
}

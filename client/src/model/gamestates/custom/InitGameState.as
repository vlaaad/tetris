/**
 * Created 25.12.12 by vlaaad
 */
package model.gamestates.custom {
import command.HideFieldViewCommand;
import command.ShowMainMenuCommand;
import command.StartNewGameCommand;

import model.KeyboardManager;

import flash.ui.Keyboard;

import controller.ICommandExecutor;

import model.gamestates.IGameState;

public class InitGameState implements IGameState {

	[Inject] public var executor:ICommandExecutor;
	[Inject] public var keyboard:KeyboardManager;

	public function InitGameState() {
		super();
	}

	public function onExit():void {
		executor.execute(HideMainMenuCommand);
		keyboard.unsubscribe();
		keyboard.unMap(Keyboard.SPACE);
	}

	public function onEnter():void {
		executor.execute(ShowMainMenuCommand);
		keyboard.subscribe();
		keyboard.map(Keyboard.SPACE, StartNewGameCommand);
	}
}
}

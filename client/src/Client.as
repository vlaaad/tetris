package {

import command.StartUpCommand;

import controller.CommandExecutor;
import model.KeyboardManager;

import flash.display.Sprite;
import flash.display.Stage;
import flash.utils.Timer;

import controller.ICommandExecutor;

import model.Field;
import model.Score;
import model.gamestates.GameStateMachine;
import model.gamestates.GameStates;
import model.gamestates.IGameState;
import model.gamestates.custom.EndGameState;
import model.gamestates.custom.InitGameState;
import model.gamestates.custom.PlayGameState;

import org.swiftsuspenders.Injector;

import view.FieldView;
import view.MainMenu;
import view.ScoreView;

public class Client extends Sprite {
	public function Client() {
		const injector:Injector = new Injector();

		//model
		injector.map(Injector).toValue(injector);
		injector.map(Stage).toValue(stage);
		injector.map(Field).toValue(new Field(9, 23));
		injector.map(KeyboardManager).asSingleton();
		injector.map(Score).asSingleton();
		injector.map(Timer).toValue(new Timer(1000));

		//controller
		injector.map(ICommandExecutor).toSingleton(CommandExecutor);

		//states
		injector.map(GameStateMachine).asSingleton();
		injector.map(IGameState, GameStates.initGame).toSingleton(InitGameState);
		injector.map(IGameState, GameStates.playGame).toSingleton(PlayGameState);
		injector.map(IGameState, GameStates.endGame).toSingleton(EndGameState);

		//view
		injector.map(FieldView).asSingleton();
		injector.map(ScoreView).asSingleton();
		injector.map(MainMenu).asSingleton();

		(injector.getInstance(ICommandExecutor) as ICommandExecutor).execute(StartUpCommand);
	}
}
}

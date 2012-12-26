/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import command.ICommand;
import controller.ICommandExecutor;

import model.Field;
import model.Score;
import model.gamestates.IGameState;
import model.gamestates.GameStateMachine;
import model.gamestates.GameStates;

import view.FieldView;

public class StartUpCommand implements ICommand {

	[Inject] public var score:Score;
	[Inject] public var executor:ICommandExecutor;
	[Inject] public var stage:Stage;
	[Inject] public var fieldView:FieldView;
	[Inject] public var field:Field;
	[Inject] public var stateMachine:GameStateMachine;
	[Inject(name=GameStates.initGame)] public var state:IGameState;

	public function execute():void {
		setupFieldView();
		setupStage();
		score.addEventListener(Event.CHANGE, onScoreChanged);

		stateMachine.setState(state);
	}

	private function onScoreChanged(e:Event):void {
		executor.execute(UpdateScoreView);
	}

	private function setupFieldView():void {
		field.addEventListener(Event.CHANGE, onFieldChanged);
		stage.addEventListener(Event.RESIZE, onResize);

		executor.execute(RedrawFieldCommand);
		executor.execute(AlignFieldViewToCenterCommand);
		executor.execute(AlignMainMenuToCenterCommand);
	}

	private function onResize(e:Event):void {
		executor.execute(AlignFieldViewToCenterCommand);
		executor.execute(AlignMainMenuToCenterCommand);

	}

	private function setupStage():void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
	}

	private function onFieldChanged(e:Event):void {
		executor.execute(RedrawFieldCommand);
	}

	public function get isSingleton():Boolean {
		return false;
	}
}
}

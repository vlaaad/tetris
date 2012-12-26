/**
 * Created 26.12.12 by vlaaad
 */
package command {
import flash.display.Stage;

import command.ICommand;

import view.ScoreView;

public class ShowScoreView implements ICommand {

	[Inject] public var score:ScoreView;
	[Inject] public var stage:Stage;

	public function execute():void {
		stage.addChild(score);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

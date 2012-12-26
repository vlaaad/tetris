/**
 * Created 26.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.Score;

import view.ScoreView;

public class UpdateScoreView implements ICommand {

	[Inject] public var score:Score;
	[Inject] public var scoreView:ScoreView;

	public function execute():void {
		scoreView.setScore(score.value);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

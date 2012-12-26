/**
 * Created 26.12.12 by vlaaad
 */
package command {
import command.ICommand;

import model.Score;

import util.DisplayObjectContainerUtil;

import view.ScoreView;

public class HideScoreView implements ICommand {
	[Inject] public var score:ScoreView;

	public function execute():void {
		DisplayObjectContainerUtil.removeFromParent(score);
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

/**
 * Created 26.12.12 by vlaaad
 */
package view {
import flash.display.Sprite;
import flash.text.TextField;

public class ScoreView extends Sprite {
	private var _tf:TextField;

	[PostConstruct] public function init():void {
		_tf = new TextField();
		addChild(_tf);
		setScore(0);
	}

	public function setScore(value:int):void {
		_tf.text = "очки: " + value;
	}
}
}

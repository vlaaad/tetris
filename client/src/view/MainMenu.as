/**
 * Created 25.12.12 by vlaaad
 */
package view {
import command.StartNewGameCommand;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import controller.ICommandExecutor;

public class MainMenu extends Sprite {

	[Inject] public var executor:ICommandExecutor;
	[Inject] public var gameStage:Stage;

	public function MainMenu() {
		super();
	}

	[PostConstruct] public function init():void {
		addButton("Новая игра", StartNewGameCommand);
		align();
	}

	private function align():void {
		x = gameStage.stageWidth / 2 - width / 2;
		y = gameStage.stageHeight / 2 - height / 2;
	}

	private function addButton(text:String, cmd:Class):void {
		const sprite:Sprite = new Sprite();
		addChild(sprite);

		const tf:TextField = new TextField();
		tf.autoSize = TextFieldAutoSize.LEFT;
		tf.wordWrap = true;
		tf.defaultTextFormat = new TextFormat(null, null, null, null, null, null, null, null, TextFormatAlign.CENTER);
		tf.text = text;
		sprite.addChild(tf);
		sprite.addEventListener(MouseEvent.CLICK, function (e:Event):void {
			executor.execute(cmd);
		});

		sprite.graphics.beginFill(0xcccccc);
		sprite.graphics.drawRoundRect(0, 0, sprite.width, sprite.height, 4, 4);
		sprite.graphics.endFill();

		sprite.mouseChildren = false;
	}


}
}

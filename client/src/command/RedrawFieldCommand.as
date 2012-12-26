/**
 * Created 25.12.12 by vlaaad
 */
package command {
import flash.utils.Dictionary;

import command.ICommand;

import model.Cell;

import model.Field;

import view.FieldView;

public class RedrawFieldCommand implements ICommand {
	[Inject] public var field:Field;
	[Inject] public var fieldView:FieldView;

	private var _colorMap:Dictionary;

	[PostConstruct] public function init():void {
		_colorMap = new Dictionary();
		_colorMap[Cell.moving] = 0x227722;
		_colorMap[Cell.existing] = 0x000000;
		_colorMap[null] = 0xffffff;
	}

	public function execute():void {
		fieldView.clear();
		fieldView.drawGrid(field.width, field.height, 0xcccccc);
		for (var i:int = 0; i < field.width; i++) {
			for (var j:int = 0; j < field.height; j++) {
				fieldView.draw(i, j, getColor(field.get(i, j)));
			}
		}
	}

	private function getColor(cell:Cell):uint {
		return _colorMap[cell] as uint;
	}

	public function get isSingleton():Boolean {
		return true;
	}
}
}

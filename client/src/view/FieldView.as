/**
 * Created 25.12.12 by vlaaad
 */
package view {
import flash.display.Sprite;

public class FieldView extends Sprite {
	private static const CELL_SIZE:uint = 16;

	public function draw(x:uint, y:uint, color:uint):void {
		graphics.beginFill(color);
		graphics.drawRoundRect(x * CELL_SIZE + 1, y * CELL_SIZE + 1, CELL_SIZE - 2, CELL_SIZE - 2, CELL_SIZE / 4, CELL_SIZE / 4);
		graphics.endFill();
	}

	public function clear():void {
		graphics.clear();
	}

	public function drawGrid(width:uint, height:uint, color:uint):void {
		graphics.lineStyle(2, color, 1, true);
		for (var i:int = 0; i <= width; i++) {
			graphics.moveTo(i * CELL_SIZE, 0);
			graphics.lineTo(i * CELL_SIZE, height * CELL_SIZE);
		}

		for (i = 0; i <= height; i++) {
			graphics.moveTo(0, i * CELL_SIZE);
			graphics.lineTo(width * CELL_SIZE, i * CELL_SIZE);
		}
		graphics.lineStyle();
	}
}
}

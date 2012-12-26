/**
 * Created 25.12.12 by vlaaad
 */
package util {
import flash.display.DisplayObjectContainer;

public class DisplayObjectContainerUtil {
	public static function removeFromParent(doc:DisplayObjectContainer):void {
		if (doc && doc.parent) {
			doc.parent.removeChild(doc);
		}
	}
}
}

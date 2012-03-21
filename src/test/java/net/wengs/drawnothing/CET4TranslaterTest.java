package net.wengs.drawnothing;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CET4TranslaterTest {

	@Test
	public void testTranslate() {
		assertEquals("n.地区，区域，范围", new CET4Translater().translate("zone"));
	}

}

package net.wengs.drawnothing;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CETTranslaterTest {

	@Test
	public void testTranslate() {
		assertEquals("n.地区，区域，范围", new CETTranslater().translate("zone"));
		assertEquals("n.锌 vt.在…上镀锌", new CETTranslater().translate("zinc"));
	}

}
